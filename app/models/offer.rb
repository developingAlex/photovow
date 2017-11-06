class Offer < ApplicationRecord
  belongs_to :photographer, class_name: 'User'
  belongs_to :listing
  validates :amount, numericality: {greater_than: 0}
end
