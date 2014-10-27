<%= render 'layouts/header' %>

json.extract! @user, :id, :email, :name, :admin, :password_digest, :created_at, :updated_at
