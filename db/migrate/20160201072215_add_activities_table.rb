class AddActivitiesTable < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.references :lesson
      t.text       :content
      t.integer    :type

      t.timestamps null: false
    end
  end
end
