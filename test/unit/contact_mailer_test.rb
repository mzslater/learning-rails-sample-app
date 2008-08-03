require File.dirname(__FILE__) + '/../test_helper'

class ContactMailerTest < ActionMailer::TestCase
    
  def test_message
    # using a the setup method is not functioning properly for Rails prior to 2.1. This should 
    # rightly be put in such a setup file
    @message = Message.new(:name => 'Bob', :email => 'bob@example.com', :company => 'Acme', 
                            :phone => '123.456.7890', :subject => 'test subject', :body => 'please test me')

    test_body = <<EOF
Email from your web site

From: Bob

Company: Acme

Phone: 123.456.7890

Message: please test me
EOF
    
    created = ContactMailer.create_message(@message)
    assert_equal 2,created.parts.size

    assert_equal "multipart/alternative", created.content_type
    assert_equal "text/plain", created.parts[0].content_type
    assert_equal "text/html", created.parts[1].content_type
    assert_equal test_body, created.parts[0].body
  end

end
