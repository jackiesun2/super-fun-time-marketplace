class User < ApplicationRecord
  has_many :review_me, class_name: 'Review', foreign_key: "reviewee_id", dependent: :destroy
  has_many :review_other, class_name: 'Review', foreign_key: "reviewer_id", dependent: :destroy
  has_many :listing, dependent: :destroy
  has_many :booking, dependent: :destroy
  has_one :profile, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
