class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :account
  has_many :orders

  has_one_attached :profilepicture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
