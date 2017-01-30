class ChangeToFKonCompetencyToLevel < ActiveRecord::Migration[5.0]
  def change
    add_column :competencies, :competency_level_id, :integer, after: :name
    remove_column :competencies, :comp_type, :string
    add_index :competencies, :competency_level_id
  end
end
