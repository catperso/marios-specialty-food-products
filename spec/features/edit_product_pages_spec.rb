require 'rails_helper'

describe "the Edit a Product process" do

  before(:each) do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "edits a product" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    visit product_path(product)
    click_on 'Edit product'
    fill_in 'Name', :with => "Toad Scramble"
    click_on 'Submit!'
    expect(page).to have_content "Toad Scramble"
    expect(page).to have_no_content "Mushroom Stew"
  end

  it "gives an error if one of the product fields is blank" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    visit edit_product_path(product)
    fill_in 'Cost', :with => ''
    click_on 'Submit!'
    expect(page).to have_content "Errors detected! Please resolve the issues and try again."
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives an error when a non-admin user tries to access this" do
    nonadmin = User.create!(:email => 'Bappy@cara.com', :password => 'epicodus')
    login_as(nonadmin, :scope => :user)
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    visit edit_product_path(product)
    expect(page).to have_content 'UNAUTHORIZED ACCESS: Please log-in with an admin account to access that resource.'
  end
end