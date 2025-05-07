class CreateFuncionarios < ActiveRecord::Migration[7.2]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
