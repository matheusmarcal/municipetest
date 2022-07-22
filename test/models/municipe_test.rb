require 'test_helper'

class MunicipeTest < ActiveSupport::TestCase
  def setup
    @municipe = Municipe.new(
      nome_completo: "Matheus Marçal",
      cpf: "45300807818",
      cns: "971584746410005",
      email: "matheusmconde@outlook.com",
      data_de_nascimento: "27/02/1996",
      telefone: "55 (12) 98201-9251"
    )
  end

  test "should be valid" do
    assert @municipe.valid?
  end

  test "birth date should be present" do
    @municipe.data_de_nascimento = "    "
    assert_not @municipe.valid?
  end

  test "birth date should be valid" do
    @municipe.birth_date_valid?
    assert @municipe.valid?
  end

  test "cpf should be present" do
    @municipe.cpf = "    "
    assert_not @municipe.valid?
  end

  test "cns should be present" do
    @municipe.cns = "    "
    assert_not @municipe.valid?
  end

  test "cns should be valid" do
    @municipe.cns_valid?
    assert @municipe.valid?
  end

  test "phone should be present" do
    @municipe.telefone = "    "
    assert_not @municipe.valid?
  end

  test "phone should be valid" do
    @municipe.phone_valid?
    assert @municipe.valid?
  end

  test "email should be present" do
    @municipe.email = "    "
    assert_not @municipe.valid?
  end

  test "email should be valid" do
    @municipe.email_valid?
    assert @municipe.valid?
  end
end
