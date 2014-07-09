require 'spec_helper'

describe "trades/index" do
  before(:each) do
    assign(:trades, [
      stub_model(Trade,
        :students => "Students",
        :sections => "Sections",
        :Course => "Course",
        :Project => "Project",
        :status => "Status"
      ),
      stub_model(Trade,
        :students => "Students",
        :sections => "Sections",
        :Course => "Course",
        :Project => "Project",
        :status => "Status"
      )
    ])
  end

  it "renders a list of trades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Students".to_s, :count => 2
    assert_select "tr>td", :text => "Sections".to_s, :count => 2
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "Project".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
