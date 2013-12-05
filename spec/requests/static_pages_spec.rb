require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Mike Sakata'" do
      visit root_path
      expect(page).to have_content('Mike Sakata')
    end

    it "should have the title 'Mike Sakata'" do
      visit root_path
      expect(page).to have_title("Mike Sakata")
    end
  end
end