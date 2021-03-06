class Post < ApplicationRecord
    belongs_to :user 
    default_scope -> { order(created_at: :desc)}
    validates :user_id, presence: true
    validates :url, presence: true
    validates :title, presence: true
    belongs_to :category ,optional: true
end