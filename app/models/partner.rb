class Partner < ApplicationRecord
  has_many :partner_memberships
  has_many :competencies, :through => :partner_memberships
  belongs_to :partner_level
  
  scope :sorted, -> { order("name ASC") }
  
  validates_presence_of :name
  
  
end
