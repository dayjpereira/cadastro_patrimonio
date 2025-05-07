class CreatePatrimonios < ActiveRecord::Migration[7.2]
  def change
    create_table :patrimonios do |t|
      t.string :nome
      t.string :numero_placa
      t.decimal :valor
      t.date :data_compra
      t.text :descricao
      t.references :funcionario, null: false, foreign_key: true
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
