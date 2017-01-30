class DropPartnerCompetencyJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :partners, :competencies
  end
end
