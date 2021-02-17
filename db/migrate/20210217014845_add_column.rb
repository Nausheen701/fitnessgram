class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :bio, :text
  end
end
