class Competency < ApplicationRecord
  has_many :partner_memberships
  has_many :partners, :through => :partner_memberships
  belongs_to :competency_type
  
  scope :sorted, -> { order("name ASC") }
end
