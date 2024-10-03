class Task < ApplicationRecord
  validates :name, :description, :user, :status, presence: true

  belongs_to :user

  belongs_to :status
end
