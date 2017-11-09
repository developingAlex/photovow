class Listing < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :offers, dependent: :destroy
  
  def self.search(search)
    keyword = search.downcase
    where("lower(title) LIKE ?", "%#{keyword}%")
  end

end
