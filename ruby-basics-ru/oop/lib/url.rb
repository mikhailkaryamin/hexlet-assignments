# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  attr_accessor :url

  attr_reader :default_url

  include Comparable

  extend Forwardable

  def initialize(url)
    @url = URI(url)
    @default_url = url
  end

  def_delegators :@url, :scheme, :host, :port, :path, :port

  def query_params
    if url.query.nil?
      return {}
    end

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
    url_without_params = URI.split(default_url)
    other_url_without_params = URI.split(other.default_url)
    url_without_params.delete_at(7)
    other_url_without_params.delete_at(7)

    is_without_params_eql = url_without_params  == other_url_without_params
    is_query_params_eql = query_params == other.query_params

    is_without_params_eql && is_query_params_eql
  end
end
# END
