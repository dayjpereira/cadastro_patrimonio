class Funcionario < ApplicationRecord
  belongs_to :departamento
  has_many :patrimonios, dependent: :nullify
 
  validates :nome, presence: true
  validates :departamento, presence: true
end
