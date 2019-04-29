class Ad < ApplicationRecord

  extend FriendlyId

  PER_PAGE = 6

  friendly_id :title, use: :slugged

  before_save :md_to_hml

  belongs_to :category, counter_cache: true
  belongs_to :member

  validates_presence_of  :picture

  validates :title, :description_md, :description_short, :category, presence: true
  validates :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  monetize :price_cents

  scope :descending_order, ->(page) {
     order(created_at: :desc).page(page).per(PER_PAGE)
  }

  scope :by_search, ->(term, page) {
     where("lower(title) LIKE ?", "%#{term.downcase}%").page(page).per(PER_PAGE)
  }

  scope :by_category, ->(id, page) {
   where(category: id).page(page).per(PER_PAGE)
 }

  scope :to_the, ->(member) { where(member: member) }

  #rake paperclip:refresh  CLASS=Ad
  has_attached_file :picture,
                     styles: { medium: "320x150#", thumb: "100x100>", large: "900X400>" },
                     default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  private
    def md_to_hml
      options = {
          filter_html: true,
          link_attributes: {
            rel: "nofollow",
            target: "_blank"
          }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
      self.description = markdown.render(self.description_md)
    end
end
