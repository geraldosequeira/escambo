class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :member

  monetize :price_cents

  scope :last_six, -> { limit(6).order(created_at: :desc) }

  has_attached_file :picture, styles: { medium: "700x400#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  #rake paperclip:refresh  CLASS=Ad
end
