class Article < ApplicationRecord
  include Visible
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
