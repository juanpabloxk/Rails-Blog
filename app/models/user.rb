class User < ApplicationRecord
    has_secure_password
    
    # My articles and comments
    has_many :comments, dependent: :destroy
    has_many :articles, dependent: :destroy
    
    # Users who follow me
    has_many :rel_followers, foreign_key: :followed_id, class_name: :Follow
    has_many :followers, :through => :rel_followers, :source => :follower
    
    # Users I follow
    has_many :rel_followeds, foreign_key: :follower_id, class_name: :Follow
    has_many :followeds, :through => :rel_followeds, :source => :followed
end