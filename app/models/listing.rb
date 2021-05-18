class Listing < ApplicationRecord
  belongs_to :user
  has_many :booking, dependent: :destroy
  has_many_attached :images
  validates :title, :description, :location, presence: true

end
