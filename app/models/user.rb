class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_one :roadmap, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :connections, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :conversations, foreign_key: :sender_id
end
