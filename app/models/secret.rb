class Secret < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true
  # validates_presence_of :category

  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
end
