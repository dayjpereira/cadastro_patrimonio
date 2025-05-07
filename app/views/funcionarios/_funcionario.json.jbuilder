json.extract! funcionario, :id, :nome, :departamento_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
