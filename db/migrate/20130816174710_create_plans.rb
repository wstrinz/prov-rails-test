class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :comment

      t.timestamps
    end
  end
end
