class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :actedOnBehalfOf
      t.string :label
      t.string :name

      t.timestamps
    end
  end
end
