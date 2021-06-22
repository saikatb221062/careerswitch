class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_one :roadmap, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy

  has_many :conversations, foreign_key: :sender_id

  has_many :connecting_relationships, foreign_key: :connecting_id, class_name: 'Connection'
  
  def connect(user_id)
    connecting_relationships.create!(connecting_id: id, connecter_id: user_id)
  end

  def connections
    Connection.where(connecting_id: id).or(Connection.where(connecter_id: id))
  end

  # def unfollow(user_id)
  #   following_relationships.find_by(connecting_id: user_id).destroy
  # end

  def is_connected?(user_id)
    relationship = Connection.find_by(
      '(connecter_id = ? AND connecting_id = ?) OR (connecting_id = ? AND connecter_id = ?)',
      user_id, id, user_id, id
    )
    return relationship
  end
end
