class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailers.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Bienvenue #{@user.first_name}"
  end
end
