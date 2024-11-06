# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user, confirmation_url)
    # BEGIN
    @user = user
    @confirmation_url = confirmation_url

    mail to: user.email, subject: "Account activation"
    # END
  end
end
