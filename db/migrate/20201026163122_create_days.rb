class CreateDays < ActiveRecord::Migration
  def up
    create_table :days do |t|
      t.string :day
    end
  end

  def down
    drop_table :users
  end
end
