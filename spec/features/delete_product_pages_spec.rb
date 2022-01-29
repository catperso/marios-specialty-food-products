require 'rails_helper'

describe "the Delete a Product process" do

  before(:each) do
    @product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
  end

  it "deletes a product" do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
    visit product_path(@product)
    click_on 'Delete product'
    expect(page).to have_no_content "Mushroom Stew"
    expect(page).to have_content "Product removed successfully!"
  end

  it "is unavailable to non-admin users" do
    user = User.create!(email: 'bappy@cara.com', password: 'epicodus', admin: false)
    login_as(user, scope: :user)
    visit product_path(@product)
    expect(page).to have_no_content "Delete product"
  end
end