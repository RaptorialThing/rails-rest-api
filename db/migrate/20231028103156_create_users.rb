class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, index: {unique: true, name: 'unique_emails'}
      t.string :password_digest
      t.integer :age

      t.timestamps
    end
  end
end
