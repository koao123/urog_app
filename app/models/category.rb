class Category < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true,length: {maximum: 16}
  has_many :posts, dependent: :destroy
end
