class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :username
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
