class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :type
      t.integer :time
      t.integer :user_id
    end
  end
end
