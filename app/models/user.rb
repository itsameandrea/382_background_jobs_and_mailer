class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :update_from_clearbit, :send_welcome_email

  private

  def update_from_clearbit
    # UpdateUserJob.perform_later(self.id)
  end

  def send_welcome_email
    puts "///////////////////////////////////////////////////////////////"
    puts self.inspect
    puts "////////////////////////////////////////////////////////////////"

    UserMailer.with(user_id: self.id).welcome_email.deliver_later
  end
end
