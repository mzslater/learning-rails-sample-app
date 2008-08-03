require File.dirname(__FILE__) + '/../test_helper'

class CategoryTest < ActiveSupport::TestCase
  fixtures :categories, :links
  
  def setup
    @link = Link.new(:url => 'http://buildingwebapps.com/', :title => 'BuildingWebApps.com', 
                      :description => 'Resource for Web Developers')
    @category = Category.new(:title => 'Programming', :description => 'All about programming')
  end
  
  def test_valid
    assert_valid @category
  end
  
end
