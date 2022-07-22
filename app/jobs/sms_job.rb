class SmsJob < ApplicationJob
  queue_as :default

  def perform(object, action)
    @object = object
    municipe_create       if action.to_s.eql? 'municipe_create'
    municipe_update       if action.to_s.eql? 'municipe_update'
  end

  private

  def municipe_create
    SendSms.new({phone: @object.telefone, message: "Olá #{@object.nome_completo}, seu cadastro de municipe foi criado!"}).call
  end

  def municipe_update
    SendSms.new({phone: @object.telefone, message: "Olá #{@object.nome_completo}, seu cadastro de municipe foi mudou para #{@object.status.eql?(true) ? 'Ativo' : 'Inativo'}!"}).call
  end

end
