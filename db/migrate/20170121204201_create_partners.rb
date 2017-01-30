class CreatePartners < ActiveRecord::Migration[5.0]
  def up
    create_table :partners do |t|
      t.string "name"
      t.string "pnet_acct"
      t.string "status"

      t.timestamps
    end
    add_index(:partners, :pnet_acct)
  end
  
  def down
    drop_table :partners
  end
end
