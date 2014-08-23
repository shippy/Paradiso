class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :netid
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
