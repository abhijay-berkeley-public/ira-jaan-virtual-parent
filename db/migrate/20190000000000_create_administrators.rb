class CreateAdministrators < ActiveRecord::Migration[6.0]
    def change
      create_table :administrators do |t|
        t.string :username
        t.string :password
        t.string :name
        t.integer :age
        t.string :email
        t.string :language
        t.text :description
        t.integer :points

        t.timestamps
      end
    end
  end
