class AddDescriptionColumnForCompetency < ActiveRecord::Migration[5.0]
  def change
    add_column :competencies, :description, :string
  end
end
