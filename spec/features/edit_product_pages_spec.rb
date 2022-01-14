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
end