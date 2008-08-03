class CreateDefaultAdminUser < ActiveRecord::Migration
  def self.up
    if !User.find_by_login('admin')
      User.create(:login => 'admin', :email => 'admin@sample.com', 
                :password => 'changeme', :password_confirmation => 'changeme')
    end
  end

  def self.down
  end
end
