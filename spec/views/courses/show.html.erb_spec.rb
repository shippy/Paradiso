require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "Name",
      :professor => "Professor",
      :email => "Email",
      :times => "Times",
      :location => "Location",
      :Project => "Project",
      :sections => "Sections"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Professor/)
    rendered.should match(/Email/)
    rendered.should match(/Times/)
    rendered.should match(/Location/)
    rendered.should match(/Project/)
    rendered.should match(/Sections/)
  end
end
