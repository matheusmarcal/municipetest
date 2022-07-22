class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos, id: :uuid do |t|
      t.references :municipe, null: false, foreign_key: true, type: :uuid
      t.string :cep, null: false
      t.string :logradouro, null: false
      t.string :complemento
      t.string :bairro, null: false
      t.string :cidade, null: false
      t.string :uf, null: false
      t.integer :codigo_ibge

      t.timestamps
    end
    add_index :enderecos, :cep
  end
end
