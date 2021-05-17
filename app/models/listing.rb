class Listing < ApplicationRecord
  belongs_to :user
  has_many :booking
  validates :title, :description, :location, pressence: true
end
