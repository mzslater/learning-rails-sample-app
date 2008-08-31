class DefaultPages < ActiveRecord::Migration
  def self.up
    if Page.find(:all).empty?
      Page.create(:name => 'home', :title => 'Learning Rails Sample Application Home', :navlabel => 'Home', :position => 1,
        :admin => false, :redirect => false,
        :body => 'h1. Welcome to the Learning Rails Sample Application')
      about_page = Page.create(:name => 'about', :title => 'About the Learning Rails Sample Application', :navlabel => 'About', :position => 2,
        :admin => false, :redirect => false,
        :body => 'h1. About This Application
        
                  p. This is the sample application for the "Learning Rails" free online course.
                  For more information, see "LearningRails.com":http://learningrails.com')
      Page.create(:name => 'resources', :title => 'Learning Rails Resources', :navlabel => 'Resources', :position => 3,
        :admin => false, :redirect => true,
        :action_name => 'list', :controller_name => 'links')
      Page.create(:name => 'contact', :title => 'Contact Us', :navlabel => 'Contact', :position => 4,
        :admin => false, :redirect => true,
        :action_name => 'new', :controller_name => 'messages')
      Page.create(:name => 'admin', :title => 'Sample App Administration', :navlabel => 'Admin', :position => 9,
        :admin => true, :redirect => false,
        :body => 'h1. Admin Dashboard

        p. "Page Admin":/pages

        p. "User Admin":/users

        p. "Category Admin":/categories

        p. "Link Admin":/links

        p. "Message Admin":/messages')
      Page.create(:name => 'services', :title => 'Services', :navlabel => 'Services', :position => 1,
        :admin => false, :redirect => false, :parent => about_page,
        :body => 'h1. Services
        
        p. This page is here just to illustrate a subpage')
      Page.create(:name => 'products', :title => 'Products', :navlabel => 'Products', :position => 2,
        :admin => false, :redirect => false, :parent => about_page,
        :body => 'h1. Products
        
        p. This page is here just to illustrate a subpage')
    end
    if Category.find(:all).empty?
      rails_resources = Category.create(:title => 'Rails Resources', :description => 'Resources for Rails Developers')
      html_resources = Category.create(:title => 'HTML Resources', :description => 'Basic HTML Resources')
      Link.create(:url => 'http://www.buildingwebapps.com', :title => 'BuildingWebApps.com', :description => 'Resource site for
      web application developers, created by the authors of the Learning Rails course').categories << rails_resources
      Link.create(:url => 'http://w3c.org', :title => 'W3C', :description => 'Official standards body for the web').categories << html_resources
    end
  end

  def self.down
  end
end
