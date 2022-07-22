require "test_helper"

class MunicipeMailerTest < ActionMailer::TestCase
  municipe = Municipe.new(nome_completo: "Matheus", cpf: "45300807818", cns: "971584746410005", email: "matheusmconde@outlook.com", data_de_nascimento: "27/02/1996", telefone: "55 (12) 98201-9251")

  test "municipe_created" do
    mail = MunicipeMailer.municipe_created(municipe)

    assert_emails 1 do
      mail.deliver_now
    end

    assert_equal "Seja bem vindo #{municipe.nome_completo}", mail.subject
    assert_equal ["#{municipe.email}"], mail.to
    assert_equal ["mtsconde@gmail.com"], mail.from
  end

  test "municipe_updated" do

    mail = MunicipeMailer.municipe_updated(municipe)

    assert_emails 1 do
      mail.deliver_now
    end

    assert_equal "Alteração no cadastro #{municipe.nome_completo}", mail.subject
    assert_equal ["#{municipe.email}"], mail.to
    assert_equal ["mtsconde@gmail.com"], mail.from
  end

end
