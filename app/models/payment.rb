class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, :amount, :date, :category_id, :payment_method, presence: true
end
