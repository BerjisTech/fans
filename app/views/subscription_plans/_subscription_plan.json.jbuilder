json.extract! subscription_plan, :id, :user_id, :title, :description, :price, :billing_frequency, :is_active, :created_at, :updated_at
json.url subscription_plan_url(subscription_plan, format: :json)
