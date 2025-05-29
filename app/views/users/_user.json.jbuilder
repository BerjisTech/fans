json.extract! user, :id, :username, :email, :role, :bio, :avatar_data, :created_at, :updated_at
json.url user_url(user, format: :json)
