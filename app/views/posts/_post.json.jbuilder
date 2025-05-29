json.extract! post, :id, :user_id, :title, :description, :is_public, :is_paid, :price, :created_at, :updated_at
json.url post_url(post, format: :json)
