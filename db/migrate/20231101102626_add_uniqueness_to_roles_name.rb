class AddUniquenessToRolesName < ActiveRecord::Migration[7.0]
  def change
    add_index :roles, :name, unique: true, name: "unique_role_name"
  end
end
