require 'spec_helper'

describe "Paradisos" do
  describe "GET /sections" do
    it "Display all sections" do
      visit sections_path
      page.should have_content 'Slanski'
    end
  end
end
