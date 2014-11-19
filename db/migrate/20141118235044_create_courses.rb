class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :kid_id

      t.timestamps
    end
  end
end
