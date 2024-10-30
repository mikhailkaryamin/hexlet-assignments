# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'net/https'

class Hacker
  class << self
    def hack(email, password)
      sign_up_uri = URI('https://rails-collective-blog-ru.hexlet.app/users/sign_up')
      sign_up_response = Net::HTTP.get_response(sign_up_uri)

      sign_up_html = Nokogiri::HTML(sign_up_response.body)
      authenticity_token = sign_up_html.at('input[@name="authenticity_token"]')['value']

      collective_blog_session_cookie = sign_up_response.response['set-cookie']
        .split('; ')
        .find { |c| c.start_with? '_collective_blog_session' }

      params = {
        'user[email]': email,
        'user[password]': password,
        'user[password_confirmation]:': password,
        'authenticity_token': authenticity_token,
        'commit': "Регистрация"
      }

      register_uri = URI('https://rails-collective-blog-ru.hexlet.app/users')
      register_request = Net::HTTP::Post.new register_uri
      register_request.body = URI.encode_www_form(params)
      register_request['Cookie'] = collective_blog_session_cookie

      http = Net::HTTP.new(register_uri.host, register_uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      register_response = http.request register_request
      register_response.code.start_with? "3"
    end
  end
end
