class Municipe < ApplicationRecord
  REGEX_PHONE = /(\d{2}\s)(\(\d{2}\)\s)(\d{4,5}\-\d{4})/
  REGEX_EMAIL = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_attached_file :foto, styles: { hd: "1980x1020", medium: "640x680>", thumb: "100x100>" }
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  has_many :enderecos

  before_save :validates_before_save
  after_create :notify_created
  after_update :notify_status, if: -> { self.saved_change_to_status? }

  validates :nome_completo, presence: { message: "O nome do municipe não pode ficar em branco."}
  validates :cpf, presence: { message: "O CPF do municipe não pode ficar em branco."}
  validates :cpf, uniqueness: { message: "CPF ja cadastrado na base de dados."}
  validates :cns, uniqueness: { message: "CNS ja cadastrado na base de dados."}
  validates :cns, presence: { message: "O CNS do municipe não pode ficar em branco."}
  validates :email, presence: { message: "O E-mail do municipe não pode ficar em branco."}
  validates :data_de_nascimento, presence: { message: "A data de nascimento do municipe não pode ficar em branco."}
  validates :telefone, presence: { message: "O telefone do municipe não pode ficar em branco."}

  def validates_before_save
    raise "Data de Nascimento inválida, por favor verifique se digitou corretamente." unless birth_date_valid?
    raise "Telefone inválido, por favor verifique se digitou corretamente. Ex: +55 (XX) 99999-9999" unless phone_valid?
    raise "E-mail inválido, por favor verifique se digitou corretamente." unless email_valid?
    raise "CNS inválido, por favor verifique se digitou corretamente." unless cns_valid?
    raise "CPF inválido, por favor verifique se digitou corretamente." unless CPF.valid?(self.cpf)
  end

  def cns_valid?
    cns_number = self.cns.strip()
    false if cns_number.size != 15
    validator = 0

    (0..14).each do |i|
      validator += cns_number[i].to_i * (15 - i)
    end

    return validator % 11 == 0
  end

  def phone_valid?
    return self.telefone.match(REGEX_PHONE)
  end

  def email_valid?
    return self.email.match(REGEX_EMAIL)
  end

  def birth_date_valid?
    return false if self.data_de_nascimento < 121.years.ago or self.data_de_nascimento > Date.today
    true
  end

  private

  def notify_created
    MailerJob.set(wait: 10.seconds).perform_later(self, 'municipe_create')
    SmsJob.set(wait: 15.seconds).perform_later(self, 'municipe_create')
  end

  def notify_status
    MailerJob.set(wait: 10.seconds).perform_later(self, 'municipe_update')
    SmsJob.set(wait: 15.seconds).perform_later(self, 'municipe_update')
  end
end
