# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  attr_accessor :url

  include Comparable

  extend Forwardable

  def initialize(url)
    @url = URI(url)
  end

  def_delegators :@url, :scheme, :host, :port, :path

  def query_params
    queries = url.query.split '&'
    queries.each_with_object({}) do |q, acc|
      query_splitted = q.split('=')
      key, value = query_splitted
      acc[key.to_sym] = value
    end
  end

  def query_param(key, default_value = nil)
    query_params[key] ||= default_value
  end

  def ==(other)
    is_scheme_eql = scheme  == other.scheme
    is_host_eql = host == other.host
    is_path_eql = path == other.path
    is_query_params_eql = query_params == other.query_params

    is_scheme_eql && is_host_eql && is_path_eql && is_query_params_eql
  end
end
# END
