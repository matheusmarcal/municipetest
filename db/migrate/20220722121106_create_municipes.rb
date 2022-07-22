class CreateMunicipes < ActiveRecord::Migration[5.2]
  def change
    create_table :municipes, id: :uuid do |t|
      t.string :nome_completo, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.datetime :data_de_nascimento, null: false
      t.string :telefone, null: false
      t.boolean :status, default: true, null: false

      t.timestamps
    end
    add_index :municipes, :cpf
    add_index :municipes, :cns
    add_index :municipes, :email
    add_index :municipes, :status
  end
end
