class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.find(params[:user_id]) # equivalent to -> @user = User.find params[:user_id]
    mail(to: @user.email, subject: 'Welcome to Our Hood')
  end
end
