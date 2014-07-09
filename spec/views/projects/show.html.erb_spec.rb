require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :administrator => "Administrator",
      :email => "Email",
      :URL => "Url",
      :courses => "Courses"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Administrator/)
    rendered.should match(/Email/)
    rendered.should match(/Url/)
    rendered.should match(/Courses/)
  end
end
