require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :teacher => "MyString",
      :email => "MyString",
      :times => "MyString",
      :location => "MyString",
      :Course => "MyString",
      :students => "MyString"
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path(@section), :method => "post" do
      assert_select "input#section_teacher", :name => "section[teacher]"
      assert_select "input#section_email", :name => "section[email]"
      assert_select "input#section_times", :name => "section[times]"
      assert_select "input#section_location", :name => "section[location]"
      assert_select "input#section_Course", :name => "section[Course]"
      assert_select "input#section_students", :name => "section[students]"
    end
  end
end
