class Patrimonio < ApplicationRecord
  belongs_to :departamento
  belongs_to :funcionario, optional: true

  validates :nome, :numero_placa, presence: true
end