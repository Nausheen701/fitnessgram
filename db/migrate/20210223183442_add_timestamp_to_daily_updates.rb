class AddTimestampToDailyUpdates < ActiveRecord::Migration[5.2]
  def change
    
      add_column :daily_updates, :timestamp, :timestamp
    
  end
end
