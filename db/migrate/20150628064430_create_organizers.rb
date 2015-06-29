class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :url
      t.string :logo

      t.timestamps
    end
  end
end
