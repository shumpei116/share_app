class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :validatable
         
  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_one_attached :image
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :introduction, presence: true, on: :update
  validates :image, presence: true, on: :update
  
end
