require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "GLF Poll" }

  describe "Home page" do
    before { visit '/static_pages/home' }

    it "should have the right title" do
      page.should have_selector('title', text: "#{base_title} | Home")
    end

    it "should have the h1 'GLF!'" do
      page.should have_selector('h1', text: "GLF!")
    end
  end

  describe "Help page" do
    before { visit '/static_pages/help' }

    it "should have the right title" do
      page.should have_selector('title', text: "#{base_title} | Help")
    end

    it "should have the h1 'Help'" do
      page.should have_selector('h1', text: "Help")
    end
  end

  describe "About page" do
    before { visit '/static_pages/about' }
    
    it "should have the right title" do
      page.should have_selector('title', text: "#{base_title} | About")
    end

    it "should have the h1 'About GLF'" do
      page.should have_selector('h1', text: "About GLF")
    end

    it "should have the h1 'About the GLF Poll'" do
      page.should have_selector('h1', text: "About the GLF Poll")
    end
  end

end
