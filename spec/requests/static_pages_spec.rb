require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "GLF Poll" }

  describe "Home page" do
    before { visit root_path }

    it "should have the base title" do
      page.should have_selector('title', text: base_title)
    end

    it "should have the right title" do
      page.should_not have_selector('title', text: "| Home")
    end

    it "should have the h1 'GLF!'" do
      page.should have_selector('h1', text: "GLF!")
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "should have the right title" do
      page.should have_selector('title', text: "#{base_title} | Help")
    end

    it "should have the h1 'Help'" do
      page.should have_selector('h1', text: "Help")
    end
  end

  describe "About page" do
    before { visit about_path }
    
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

  describe "Contact page" do
    before { visit contact_path }

    it "should have the h1 'Contact'" do
      page.should have_selector('h1', text: "Contact")
    end

    it "should have the title 'Contact'" do
      page.should have_selector('title', text: "#{base_title} | Contact")
    end
  end

end
