class AddCourseToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :course 
  end
end
