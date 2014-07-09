require 'spec_helper'

describe "trades/new" do
  before(:each) do
    assign(:trade, stub_model(Trade,
      :students => "MyString",
      :sections => "MyString",
      :Course => "MyString",
      :Project => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new trade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trades_path, :method => "post" do
      assert_select "input#trade_students", :name => "trade[students]"
      assert_select "input#trade_sections", :name => "trade[sections]"
      assert_select "input#trade_Course", :name => "trade[Course]"
      assert_select "input#trade_Project", :name => "trade[Project]"
      assert_select "input#trade_status", :name => "trade[status]"
    end
  end
end
