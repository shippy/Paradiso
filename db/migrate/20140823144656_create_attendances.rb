class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :student
      t.belongs_to :section
      t.timestamps
    end
  end
end
