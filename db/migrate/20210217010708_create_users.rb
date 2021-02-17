class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :course_id
      t.integer :instructor_id
    end
  end
end
