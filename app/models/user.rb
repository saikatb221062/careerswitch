class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_one :roadmap, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :connections, dependent: :destroy
  has_many :connecting_id, -> { where connections: { status: :accepted } } through: :connections
  has_many :requested_connecting_id, -> { where connections: { status: :requested } } through: :connections, source: :connecting_id
  has_many :pending_connecting_id, -> { where connections: { status: :pending } } through: :connections, source: :connecting_id
  has_many :blocked_connecting_id, -> { where connections: { status: :blocked } } through: :connections, source: :connecting_id

  has_many :messages, dependent: :destroy

  has_many :connections_inverse, class_name: 'Connections', foreign_key: :user_id
  has_many :connected_id_inverse, through: :connections_inverse

  has_many :conversations, foreign_key: :sender_id

  def connections_request(user_id)
    unless self == user_id || Connection.where(user: self, connecting_id: connecting_id).exists?
      transaction do
        Connection.create(user: self, connecting_id: connecting_id, status: :pending)
        Connection.create(user: connecting_id, friend: self, status: :requested)
      end
    end
  end

  def accept_request(connecting_id)
    transaction do
      Connection.find_by(user: self, connecting_id: connecting_id, status: [:requested])&.accepted!
      Connection.find_by(user: friend, connecting_id: self, status: [:pending])&.accepted!
    end
  end
end
