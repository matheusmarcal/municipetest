class Endereco < ApplicationRecord
  belongs_to :municipe

  validates :cep, presence: { message: "O CEP não pode ficar em branco."}
  validates :cep, length: { minimum: 9, maximum: 9, too_short: "CEP tem menos de 9 digitos", too_long: "CEP tem mais de 9 digitos" }
  validates :logradouro, presence: { message: "O Logradouro não pode ficar em branco."}
  validates :bairro, presence: { message: "O Bairro não pode ficar em branco."}
  validates :cidade, presence: { message: "A Cidade não pode ficar em branco."}
  validates :uf, presence: { message: "O Estado não pode ficar em branco."}
  validates :uf, length: { minimum: 2, maximum: 2, too_short: "UF tem menos de 2 digitos", too_long: "UF tem mais de 2 digitos" }
end
