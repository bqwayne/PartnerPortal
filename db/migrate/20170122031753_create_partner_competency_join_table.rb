class CreatePartnerCompetencyJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :partners, :competencies do |t|
      # t.index [:partner_id, :competency_id]
      t.index [:competency_id, :partner_id], unique: true
    end
  end
end
