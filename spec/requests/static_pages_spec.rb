require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('a', text: 'Mike Sakata') }
    it { should have_title('Mike Sakata') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About Me') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_selector('h1', text: 'About Me')
    click_link "Sign up"
    expect(page).to have_selector('h1', text: 'Sign up')
    # click_link "Sign in"
    # expect(page).to have_selector('h1', text: 'Sign in')
  end
end