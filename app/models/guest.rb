class Guest < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :messages, as: :messageable, dependent: :destroy
  has_many :messages, as: :messageable
  has_many :received_notifications, as: :notifiable, foreign_key: 'notifiable_id' ,class_name: 'Notification'
  # has_many :sent_notifications, as: :notifierable


end
