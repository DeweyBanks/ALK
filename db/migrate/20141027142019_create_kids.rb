class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string      :name,         null: false
      t.string      :email,        null: false
      t.integer     :grade
      t.string      :classroom
      t.date        :dob
      t.string      :address
      t.string      :apt
      t.string      :city
      t.string      :state,         default: "New York"
      t.integer     :zip
      t.string      :home_phone
      t.string      :work_phone
      t.string      :parent
      t.string      :pickup
      t.text        :allergies

    end
  end
end
