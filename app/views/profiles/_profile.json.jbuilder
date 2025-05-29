json.extract! profile, :id, :user_id, :display_name, :about, :cover_photo_data, :is_creator, :created_at, :updated_at
json.url profile_url(profile, format: :json)
