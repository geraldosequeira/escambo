class Category < ApplicationRecord

  validates_presence_of :description

  has_many :ads

  scope :order_by_description, -> { order(:description) }
end
