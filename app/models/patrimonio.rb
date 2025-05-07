class Patrimonio < ApplicationRecord
  belongs_to :funcionario
  belongs_to :departamento

  validates :nome, :numero_placa, presence: true
end
