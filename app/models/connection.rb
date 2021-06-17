class Connection < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :user

  belongs_to :follower, foreign_key: 'connected_id', class_name: 'User'
  belongs_to :following, foreign_key: 'connecting_id', class_name: 'User'
end
