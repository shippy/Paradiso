class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def new
    @title = "Create new student entry"
    @student = Student.new
    @sections = Sections.all
  end
  
  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student
    end
  end
  
  def update
    
  end
  
  def batch_import
    
  end
end
