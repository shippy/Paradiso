require 'spec_helper'

describe "sections/show" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :teacher => "Teacher",
      :email => "Email",
      :times => "Times",
      :location => "Location",
      :Course => "Course",
      :students => "Students"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Teacher/)
    rendered.should match(/Email/)
    rendered.should match(/Times/)
    rendered.should match(/Location/)
    rendered.should match(/Course/)
    rendered.should match(/Students/)
  end
end
