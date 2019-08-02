class AddUserToMeets < ActiveRecord::Migration[5.2]
  def change
    add_reference :meets, :username, foreign_key: true
  end
end
