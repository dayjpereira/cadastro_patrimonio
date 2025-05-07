require "application_system_test_case"

class PatrimoniosTest < ApplicationSystemTestCase
  setup do
    @patrimonio = patrimonios(:one)
  end

  test "visiting the index" do
    visit patrimonios_url
    assert_selector "h1", text: "Patrimonios"
  end

  test "should create patrimonio" do
    visit patrimonios_url
    click_on "New patrimonio"

    fill_in "Data compra", with: @patrimonio.data_compra
    fill_in "Departamento", with: @patrimonio.departamento_id
    fill_in "Descricao", with: @patrimonio.descricao
    fill_in "Funcionario", with: @patrimonio.funcionario_id
    fill_in "Nome", with: @patrimonio.nome
    fill_in "Numero placa", with: @patrimonio.numero_placa
    fill_in "Valor", with: @patrimonio.valor
    click_on "Create Patrimonio"

    assert_text "Patrimonio was successfully created"
    click_on "Back"
  end

  test "should update Patrimonio" do
    visit patrimonio_url(@patrimonio)
    click_on "Edit this patrimonio", match: :first

    fill_in "Data compra", with: @patrimonio.data_compra
    fill_in "Departamento", with: @patrimonio.departamento_id
    fill_in "Descricao", with: @patrimonio.descricao
    fill_in "Funcionario", with: @patrimonio.funcionario_id
    fill_in "Nome", with: @patrimonio.nome
    fill_in "Numero placa", with: @patrimonio.numero_placa
    fill_in "Valor", with: @patrimonio.valor
    click_on "Update Patrimonio"

    assert_text "Patrimonio was successfully updated"
    click_on "Back"
  end

  test "should destroy Patrimonio" do
    visit patrimonio_url(@patrimonio)
    click_on "Destroy this patrimonio", match: :first

    assert_text "Patrimonio was successfully destroyed"
  end
end
