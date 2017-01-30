class ChangeCompLevelOnPartnerMembership < ActiveRecord::Migration[5.0]
  def change
    rename_column :partner_memberships, :comp_level, :competency_level_id
  end
end
