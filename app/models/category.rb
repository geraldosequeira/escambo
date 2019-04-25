class Category < ApplicationRecord

  extend FriendlyId
  friendly_id :description, use: :slugged

  validates_presence_of :description

  has_many :ads

  scope :linked_ad_order_by_description, -> { joins(:ads).distinct.order(:description) }
end
