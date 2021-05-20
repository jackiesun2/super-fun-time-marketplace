class User < ApplicationRecord
  has_many :reviewee, class_name: 'Review', foreign_key: "reviewee_id", dependent: :destroy
  has_many :reviewer, class_name: 'Review', foreign_key: "reviewer_id", dependent: :destroy
  has_many :listing, dependent: :destroy
  has_many :booking, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
