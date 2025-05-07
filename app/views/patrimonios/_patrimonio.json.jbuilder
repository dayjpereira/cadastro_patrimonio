json.extract! patrimonio, :id, :nome, :numero_placa, :valor, :data_compra, :descricao, :funcionario_id, :departamento_id, :created_at, :updated_at
json.url patrimonio_url(patrimonio, format: :json)
