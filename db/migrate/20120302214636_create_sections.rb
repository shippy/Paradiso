class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :teacher
      t.string :days
      t.string :time
      t.integer :id
      t.integer :count

      t.timestamps
    end
  end
end
