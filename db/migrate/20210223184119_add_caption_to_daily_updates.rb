class AddCaptionToDailyUpdates < ActiveRecord::Migration[5.2]
  def change
    
      add_column :daily_updates, :caption, :string
    
  end
end
