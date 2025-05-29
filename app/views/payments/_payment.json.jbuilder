json.extract! payment, :id, :user_id, :amount, :payment_method, :status, :transaction_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
