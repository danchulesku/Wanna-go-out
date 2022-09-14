class UserMailer < ApplicationMailer
  def registration(user)
    @email = user.email
    @name = user.name

    mail to: @email
  end
end
