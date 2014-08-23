class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :professor
      t.string :time_slot
      t.string :place

      t.belongs_to :course

      t.timestamps
    end
  end
end
