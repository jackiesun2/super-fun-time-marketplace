class Listing < ApplicationRecord
  belongs_to :user
  has_many :booking, dependent: :destroy
  validates :title, :description, :location, presence: true
end
