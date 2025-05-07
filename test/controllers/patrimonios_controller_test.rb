require "test_helper"

class PatrimoniosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patrimonio = patrimonios(:one)
  end

  test "should get index" do
    get patrimonios_url
    assert_response :success
  end

  test "should get new" do
    get new_patrimonio_url
    assert_response :success
  end

  test "should create patrimonio" do
    assert_difference("Patrimonio.count") do
      post patrimonios_url, params: { patrimonio: { data_compra: @patrimonio.data_compra, departamento_id: @patrimonio.departamento_id, descricao: @patrimonio.descricao, funcionario_id: @patrimonio.funcionario_id, nome: @patrimonio.nome, numero_placa: @patrimonio.numero_placa, valor: @patrimonio.valor } }
    end

    assert_redirected_to patrimonio_url(Patrimonio.last)
  end

  test "should show patrimonio" do
    get patrimonio_url(@patrimonio)
    assert_response :success
  end

  test "should get edit" do
    get edit_patrimonio_url(@patrimonio)
    assert_response :success
  end

  test "should update patrimonio" do
    patch patrimonio_url(@patrimonio), params: { patrimonio: { data_compra: @patrimonio.data_compra, departamento_id: @patrimonio.departamento_id, descricao: @patrimonio.descricao, funcionario_id: @patrimonio.funcionario_id, nome: @patrimonio.nome, numero_placa: @patrimonio.numero_placa, valor: @patrimonio.valor } }
    assert_redirected_to patrimonio_url(@patrimonio)
  end

  test "should destroy patrimonio" do
    assert_difference("Patrimonio.count", -1) do
      delete patrimonio_url(@patrimonio)
    end

    assert_redirected_to patrimonios_url
  end
end
