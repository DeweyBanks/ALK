<%= render 'layouts/header' %>

json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :admin, :password_digest
  json.url user_url(user, format: :json)
end
