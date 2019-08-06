class AddColumnToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digested, :string
    add_reference :meets, :username, foreign_key: true
  end
end
