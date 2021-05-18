class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture
  validates :first_name, :last_name, presence: true
end
