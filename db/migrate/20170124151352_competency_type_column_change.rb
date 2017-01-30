class CompetencyTypeColumnChange < ActiveRecord::Migration[5.0]
  def change
    change_table :competencies do |t|
      t.rename :type, :comp_type
    end
  end
end
