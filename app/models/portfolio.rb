class Portfolio < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  
end
