class User < ApplicationRecord
    has_secure_password
    # Users who follow me
    # has_many :followers, foreign_key: :followed_id, class_name: "Follow"
    # has_many :its_followers, through: :followers, source: :follower

    # Users I follow
    # has_many :followers, foreign_key: :follower_id, class_name: "Follow"
    # has_many :its_follows, through: :followers, source: :followed 

    # has_many :follows, foreign_key: :followed_id, class_name: "Follow"
    # has_many(
    #     :its_followers,
    #     :through => "follows",
    #     :class_name => "Follow",
    #     :source => "follower",
    #     :foreign_key => "followed_id"
    # )

    has_and_belongs_to_many(
        :users,
        :join_table => "follows",
        :foreign_key => "followed_id",
        :association_foreign_key => "follower_id")

end
