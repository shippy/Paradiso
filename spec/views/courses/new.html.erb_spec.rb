require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :name => "MyString",
      :professor => "MyString",
      :email => "MyString",
      :times => "MyString",
      :location => "MyString",
      :Project => "MyString",
      :sections => "MyString"
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_name", :name => "course[name]"
      assert_select "input#course_professor", :name => "course[professor]"
      assert_select "input#course_email", :name => "course[email]"
      assert_select "input#course_times", :name => "course[times]"
      assert_select "input#course_location", :name => "course[location]"
      assert_select "input#course_Project", :name => "course[Project]"
      assert_select "input#course_sections", :name => "course[sections]"
    end
  end
end
