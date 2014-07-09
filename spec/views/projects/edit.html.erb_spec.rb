require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :administrator => "MyString",
      :email => "MyString",
      :URL => "MyString",
      :courses => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_administrator", :name => "project[administrator]"
      assert_select "input#project_email", :name => "project[email]"
      assert_select "input#project_URL", :name => "project[URL]"
      assert_select "input#project_courses", :name => "project[courses]"
    end
  end
end
