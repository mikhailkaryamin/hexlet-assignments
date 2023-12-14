# frozen_string_literal: true
require 'uri'
require 'forwardable'

# BEGIN
class Url
  attr_accessor :url

  extend Forwardable

  include Comparable

  def_delegators :@url, :scheme, :host, :port

  def initialize(url)
    @url = URI url
  end

  def query_params()
    if @url.query.nil?
      {}
    else
      queries = URI.decode_www_form(@url.query).to_h.transform_keys(&:to_sym)
    end
  end

  def query_param(param, default_value = nil)
    query_params[param] || default_value
  end

  def ==(other_url)
    scheme == other_url.scheme &&
    host == other_url.host &&
    port == other_url.port &&
    query_params == other_url.query_params
  end
end
# END
