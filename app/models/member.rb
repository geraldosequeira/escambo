class Member < ApplicationRecord

  has_many :ads
  has_one :profile_member

  accepts_nested_attributes_for :profile_member

  validate :nested_attributes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  MUST_BE_VALID_NESTED_ATTRIBUTES = { 1 => "first_name", 2 => "second_name" }

  def nested_attributes
    profile_member.attributes.each do |attribute, value|
      if MUST_BE_VALID_NESTED_ATTRIBUTES.has_value?(attribute) and value.blank?
        add_error_nested_attributes(attribute)
      end
    end
  end

  def add_error_nested_attributes(attribute)
    errors.add(:base, "#{ProfileMember.human_attribute_name(attribute)} deve ser preenchido")
  end

end
