json.extract! user, :id, :nome, :filial_id, :tipo, :email, :created_at, :updated_at
json.url usuario_url(user, format: :json)