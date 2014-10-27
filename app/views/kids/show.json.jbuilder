<%= render 'layouts/header' %>

json.extract! @kid, :id, :email, :name, :grade, :classroom, :dob, :address, :apt, :city, :state, :zip, :home_phone, :work_phone, :parent, :pickup, :allergies, :created_at, :updated_at, :user_id


