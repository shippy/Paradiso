require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :netid => "MyString",
      :name => "MyString",
      :email => "MyString",
      :sections => "MyString",
      :exceptions => "MyString",
      :desires => "MyString",
      :trades => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path, :method => "post" do
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
