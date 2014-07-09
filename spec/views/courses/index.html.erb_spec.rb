require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :name => "Name",
        :professor => "Professor",
        :email => "Email",
        :times => "Times",
        :location => "Location",
        :Project => "Project",
        :sections => "Sections"
      ),
      stub_model(Course,
        :name => "Name",
        :professor => "Professor",
        :email => "Email",
        :times => "Times",
        :location => "Location",
        :Project => "Project",
        :sections => "Sections"
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Professor".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Times".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Project".to_s, :count => 2
    assert_select "tr>td", :text => "Sections".to_s, :count => 2
  end
end
