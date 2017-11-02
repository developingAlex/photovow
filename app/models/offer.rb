class Offer < ApplicationRecord
  belongs_to :photographer, class_name: 'User'
  belongs_to :listing
end
