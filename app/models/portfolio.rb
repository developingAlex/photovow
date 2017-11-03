class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy

end
