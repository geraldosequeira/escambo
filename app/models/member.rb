class Member < ApplicationRecord

  has_many :ads
  has_one :profile_member

  accepts_nested_attributes_for :profile_member

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
