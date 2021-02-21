class CreateDailyUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_updates do |t|
      t.timestamp 
      t.string :workout_type
      t.integer :workout_minutes
      t.integer :calories_burned
      t.integer :user_id
  end
end

end