require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :administrator => "MyString",
      :email => "MyString",
      :URL => "MyString",
      :courses => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_administrator", :name => "project[administrator]"
      assert_select "input#project_email", :name => "project[email]"
      assert_select "input#project_URL", :name => "project[URL]"
      assert_select "input#project_courses", :name => "project[courses]"
    end
  end
end
