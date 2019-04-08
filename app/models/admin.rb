class Admin < ApplicationRecord

=begin Trabalhando com Enuns 1
  enum role: { :full_access, :restricted_access }
  enum role: [ :full_access => 0, :restricted_access => 1]
  scope :with_full_access, -> { where(role: :full_access).order(:asc) }
=end

  # Trabalhando com Enuns 2
  #Constant with block
  ROLES = { :full_access => 0, :restricted_access => 1 }

  enum role: ROLES

  scope :with_full_access, -> { where(role: ROLES[:full_access ]).order(:asc) }
  scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]).order(:asc) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
end

