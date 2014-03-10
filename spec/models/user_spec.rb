# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do


  before(:each) do
    attr = { :name => "Example User", :email => "user@example.com"} 
  end 

  it "should create a new instance given a valid attribute" do User.create!(@attr)
  end

  it "should require a name" do
  	no_name_user = User.new (@attr.merge(:name => ""))
  	no_name_user.should_not be_valid
  end

  it "should require an email address" do
  	no_email_user = User.new(@attr.merge(:email=> ""))
  	no_email_user.should_not be_valid
  end

  it "should reject names that are too long"
    long_name = "a" *51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:name => address))
    end 
  end 

  it "should reject invalid email addresses" do 
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
end
