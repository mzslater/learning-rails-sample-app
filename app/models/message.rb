class Message < ActiveRecord::Base
  validates_presence_of :name, :subject, :body
  validates_format_of :email, :with => /^(\S+)@(\S+)\.(\S+)$/
end
