class CreateDatastructuredefinitions < ActiveRecord::Migration
  def change
    create_table :datastructuredefinitions do |t|
      t.string :component

      t.timestamps
    end
  end
end
