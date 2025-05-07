class Departamento < ApplicationRecord
    has_many :funcionarios, dependent: :destroy
    has_many :patrimonios, dependent: :destroy

    validates :nome, presence: true
end
