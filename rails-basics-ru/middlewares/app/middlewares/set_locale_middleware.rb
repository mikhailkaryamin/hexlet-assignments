# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    switch_locale(env)
  end

  def switch_locale(env)
    locale = extract_locale_from_accept_language_header(env) || I18n.default_locale
    I18n.locale = locale
    @app.call(env)
  end

  private
    def extract_locale_from_accept_language_header(env)
      env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
