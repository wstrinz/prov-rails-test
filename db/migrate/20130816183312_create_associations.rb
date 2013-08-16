class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.string :label
      t.string :agent
      t.string :hadPlan

      t.timestamps
    end
  end
end
