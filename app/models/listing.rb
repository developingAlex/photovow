class Listing < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :offers, dependent: :destroy
end
