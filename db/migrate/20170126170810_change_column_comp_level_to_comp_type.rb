class ChangeColumnCompLevelToCompType < ActiveRecord::Migration[5.0]
  def change
    rename_column :competencies, :competency_level_id, :competency_type_id
  end
end
