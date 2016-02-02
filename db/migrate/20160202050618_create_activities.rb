class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :log_id
      t.string :content
      t.string :activity_type

      t.timestamps null: false
    end
  end
end
