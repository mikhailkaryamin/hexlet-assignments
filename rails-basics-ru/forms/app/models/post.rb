class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :summary, presence: true
  validates :published, inclusion: [true, false]
end
