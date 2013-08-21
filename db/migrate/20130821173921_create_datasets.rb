class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :label
      t.string :structure

      t.timestamps
    end
  end
end
