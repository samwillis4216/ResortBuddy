class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :first_name, :last_name, :email, :password, :message => "All fields must be filled in"
  validates_length_of :password, :in => 6..20, :message => "A minimum of six characters is required"
  validates_uniqueness_of :email, :message => "This email has already been taken"
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => "This is not a valid email"



  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :messages, as: :messageable, dependent: :destroy
  has_many :messages, as: :messageable
  has_many :received_notifications, as: :notifiable, foreign_key: 'notifiable_id' ,class_name: 'Notification'
  # has_many :sent_notifications, as: :notifierable

end
