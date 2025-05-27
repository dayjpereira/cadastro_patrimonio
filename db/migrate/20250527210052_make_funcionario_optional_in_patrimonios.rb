class MakeFuncionarioOptionalInPatrimonios < ActiveRecord::Migration[6.1]
  def change
    change_column_null :patrimonios, :funcionario_id, true
  end
end
