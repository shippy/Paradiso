require 'spec_helper'

describe "trades/show" do
  before(:each) do
    @trade = assign(:trade, stub_model(Trade,
      :students => "Students",
      :sections => "Sections",
      :Course => "Course",
      :Project => "Project",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Students/)
    rendered.should match(/Sections/)
    rendered.should match(/Course/)
    rendered.should match(/Project/)
    rendered.should match(/Status/)
  end
end
