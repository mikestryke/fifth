json.array!(@secrets) do |secret|
  json.extract! secret, :id, :description, :user_id
  json.url secret_url(secret, format: :json)
end
