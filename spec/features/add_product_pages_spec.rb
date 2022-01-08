require 'rails_helper'

describe "the Add A Product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'Mushroom Stew'
    fill_in 'Cost', :with => '69'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Submit!'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Mushroom Stew'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Submit!'
    expect(page).to have_content "Name can't be blank"
  end
end