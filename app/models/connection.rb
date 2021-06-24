class Connection < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :connecter, foreign_key: 'connecter_id', class_name: 'User'
  belongs_to :connecting, foreign_key: 'connecting_id', class_name: 'User'
end
