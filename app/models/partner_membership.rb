class PartnerMembership < ApplicationRecord
  belongs_to :partner
  belongs_to :competency
  belongs_to :competency_level
  
  
end