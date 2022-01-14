require 'rails_helper'

describe "the differences between user and admin accounts" do
  it "shouldn't be able to add products with a user account" do
    user = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus')
    login_as(user, :scope => :user)
    visit products_path
    expect(page).to have_no_content "Add new product"
  end

  it "should be able to add products with an admin account" do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
    visit products_path
    expect(page).to have_content "Add new product"
  end
end