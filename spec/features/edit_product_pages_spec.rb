require 'rails_helper'

describe "the Edit a Product process" do
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