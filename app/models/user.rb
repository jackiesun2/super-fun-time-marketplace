class User < ApplicationRecord
  has_many :review_me, class_name: 'Review', foreign_key: "reviewee_id"
  has_many :review_other, class_name: 'Review', foreign_key: "reviewer_id"
  has_many :listing
  has_many :booking
  has_one :profile 


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
