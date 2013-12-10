require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_css('a', text: 'Mike Sakata') }
    it { should have_title('Mike Sakata') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_css('h1', text: 'About Me') }
  end
end