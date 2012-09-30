class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :netid
      t.integer :id
      t.string :current
      t.string :desired
      t.boolean :student

      t.timestamps
    end
  end
end
