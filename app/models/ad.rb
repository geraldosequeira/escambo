class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  validates_presence_of :id, :title, :category_id, :price, :description, :picture

  monetize :price_cents

  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :find_by_member, ->(member) { member.ads }

  #rake paperclip:refresh  CLASS=Ad
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
