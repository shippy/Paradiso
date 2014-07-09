require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :administrator => "Administrator",
        :email => "Email",
        :URL => "Url",
        :courses => "Courses"
      ),
      stub_model(Project,
        :administrator => "Administrator",
        :email => "Email",
        :URL => "Url",
        :courses => "Courses"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Administrator".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Courses".to_s, :count => 2
  end
end
