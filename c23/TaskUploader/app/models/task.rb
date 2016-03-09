class Task < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :tests, presence: true

  has_many :comments, :as => :commentable
end
