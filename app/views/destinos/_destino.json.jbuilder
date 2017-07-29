json.extract! destino, :id, :nome, :email, :celular, :created_at, :updated_at
json.url destino_url(destino, format: :json)