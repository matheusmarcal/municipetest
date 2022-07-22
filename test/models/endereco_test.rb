require 'test_helper'

class EnderecoTest < ActiveSupport::TestCase
  def setup
    @endereco = Endereco.new(
      municipe_id: 1,
      logradouro: "Rua Emilio Marelo, 182",
      bairro: "Jd das Industrias",
      cidade: "São José dos Campos",
      uf: "SP",
      cep: "12241-200",
      complemento: "apt 806",
      codigo_ibge: "123123"
    )
  end

  test "should not be valid" do
    assert_not @endereco.valid?
  end

  test "cep should be valid" do
    @endereco.cep = "     "
    assert_not @endereco.valid?
    @endereco.cep = "123456789"
    assert_not @endereco.valid?
    @endereco.cep = "A" * 8
    assert_not @endereco.valid?
  end

  test "cep must have nine characters" do
    @endereco.cep.size != 9
    assert_not @endereco.valid?
  end

  test "logradouro should be present" do
    @endereco.logradouro = "    "
    assert_not @endereco.valid?
  end

  test "bairro should be present" do
    @endereco.bairro = "    "
    assert_not @endereco.valid?
  end

  test "cidade should be present" do
    @endereco.cidade = "    "
    assert_not @endereco.valid?
  end

  test "uf should be present" do
    @endereco.uf = "    "
    assert_not @endereco.valid?
  end

  test "uf must have two characters" do
    @endereco.uf = "São Paulo"
    assert_not @endereco.valid?
    @endereco.uf = "S"
    assert_not @endereco.valid?
  end
end
