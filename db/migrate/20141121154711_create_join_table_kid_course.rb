class CreateJoinTableKidCourse < ActiveRecord::Migration
  def change
    create_join_table :kids, :courses do |t|
       t.index [:kid_id, :course_id]
       t.index [:course_id, :kid_id]
    end
  end
end
