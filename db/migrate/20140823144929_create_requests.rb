class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :student
      t.references :original_section
      t.references :target_section
      t.boolean :active
      t.timestamps
    end
  end
end
