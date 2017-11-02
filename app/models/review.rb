class Review < ApplicationRecord
  belongs_to :author
  belongs_to :portfolio
end
