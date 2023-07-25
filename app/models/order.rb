class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  # enum payment_method: {
  #   credit card: 0,
  #   bank transfers: 1
  # } 
end
