class MunicipeMailer < ApplicationMailer
  default from: "mtsconde@gmail.com"
  layout "mailer"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.municipe_mailer.municipe_created.subject
  #
  def municipe_created(municipe)
    @municipe = municipe
    mail(:to => @municipe.email.to_s, :subject => "Seja bem vindo #{@municipe.nome_completo}" )
  end

  def municipe_updated(municipe)
    @municipe = municipe
    mail(:to => @municipe.email.to_s, :subject => "Alteração no cadastro #{@municipe.nome_completo}" )
  end
end
