class RemoveKidIdFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :kid_id, :integer
  end
end
