class Category < ApplicationRecord
  belongs_to :user
  has_many :payments

  validates :name, presence: true
  validates :budget, presence: true
end
