require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :netid => "Netid",
      :name => "Name",
      :email => "Email",
      :sections => "Sections",
      :exceptions => "Exceptions",
      :desires => "Desires",
      :trades => "Trades"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Netid/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Sections/)
    rendered.should match(/Exceptions/)
    rendered.should match(/Desires/)
    rendered.should match(/Trades/)
  end
end
