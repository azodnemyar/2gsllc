require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do
    
    it "should have the content '2GS'" do
      visit root_path
      expect(page).to have_content('2GS')
    end
  end
end
