class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :subject
      t.string :label
      t.string :generated
      t.string :used

      t.timestamps
    end
  end
end
