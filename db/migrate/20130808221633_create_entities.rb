class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :subject
      t.string :wasGeneratedBy

      t.timestamps
    end
  end
end
