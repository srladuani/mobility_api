class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :authentication_token
      t.string :full_name
      t.string :password
      t.string :country
      t.integer :role_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
