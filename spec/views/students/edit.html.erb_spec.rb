require 'spec_helper'

describe "students/edit" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :netid => "MyString",
      :name => "MyString",
      :email => "MyString",
      :sections => "MyString",
      :exceptions => "MyString",
      :desires => "MyString",
      :trades => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path(@student), :method => "post" do
      assert_select "input#student_netid", :name => "student[netid]"
      assert_select "input#student_name", :name => "student[name]"
      assert_select "input#student_email", :name => "student[email]"
      assert_select "input#student_sections", :name => "student[sections]"
      assert_select "input#student_exceptions", :name => "student[exceptions]"
      assert_select "input#student_desires", :name => "student[desires]"
      assert_select "input#student_trades", :name => "student[trades]"
    end
  end
end
