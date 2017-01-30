class CreatePartnerMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :partner_memberships do |t|
      t.integer :partner_id
      t.integer :competency_id
      t.integer :comp_level
      t.integer :num_vse
      t.integer :num_vseplus
      t.integer :num_vcs
      t.timestamps
    end
    add_index("partner_memberships", ['partner_id', 'competency_id'])
  end
end
