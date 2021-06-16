class Connection < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :user
  belongs_to :connected_id, class_name: 'User'
  enum status: { pending: 0, requested: 1, accepted: 2, blocked: 3 }
end
