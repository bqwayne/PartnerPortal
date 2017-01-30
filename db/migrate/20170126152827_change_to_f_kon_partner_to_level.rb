class ChangeToFKonPartnerToLevel < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :partner_level_id, :integer, after: :pnet_acct
    remove_column :partners, :status, :string
    add_index :partners, :partner_level_id
  end
end
