require 'rails_helper'

describe "the Add a Review process" do

  before(:each) do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "adds a new review" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    visit product_path(product)
    click_link "Add a review"
    fill_in 'Author', :with => 'Luigi'
    fill_in 'Content body', :with => "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums"
    fill_in 'Rating', :with => '5'
    click_on 'Submit!'
    expect(page).to have_content 'Review created successfully!'
    expect(page).to have_content "Luigi's review"
  end

  it "gives an error when no author is entered" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    visit new_product_review_path(product)
    click_on 'Submit!'
    expect(page).to have_content "Errors detected! Please resolve the issues and try again."
    expect(page).to have_content "Author can't be blank"
  end
end