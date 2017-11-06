class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :portfolio
  has_many :photos, through: :portfolios

  def fullname
    "#{first_name} #{last_name}"
  end
end
