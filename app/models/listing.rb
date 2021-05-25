class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :images
  geocoded_by :location 
  after_validation :geocode
  validates :title, :description, :location, presence: true
end
