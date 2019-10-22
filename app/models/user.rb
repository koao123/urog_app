class User < ApplicationRecord
    before_save {self.email=email.downcase}
    has_secure_password
    has_many :posts, dependent: :destroy
    def feed
        Post.where("user_id=?",id)
    end
end
