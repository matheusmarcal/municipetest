class AddFotoToMunicipe < ActiveRecord::Migration[5.2]
  def up
    add_attachment :municipes, :foto
  end

  def down
    remove_attachment :municipes, :foto
  end
end
