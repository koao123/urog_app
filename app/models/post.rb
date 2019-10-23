class Post < ApplicationRecord
    belongs_to :user ,dependent: :destroy
    default_scope -> { order(created_at: :desc)}
    validates :url, presence: true
end
