require 'rails_helper'

describe "the Edit a Review process" do

  before(:each) do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "edits a review" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    review = Review.create(author: "Luigi", content_body: "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums", rating: '5', product_id: product.id)
    visit product_review_path(product, review)
    click_link "Edit review"
    fill_in 'Author', :with => "Princess Peach"
    click_on 'Submit!'
    expect(page).to have_content "Princess Peach"
    expect(page).to have_no_content "Luigi"
  end

  it "gives an error when one of the update fields is blank" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    review = Review.create(author: "Luigi", content_body: "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums", rating: '5', product_id: product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Content body', :with => ''
    click_on 'Submit!'
    expect(page).to have_content "Errors detected! Please resolve the issues and try again."
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end

  it "gives an error when a non-admin user tries to access this" do
    nonadmin = User.create!(:email => 'Bappy@cara.com', :password => 'epicodus')
    login_as(nonadmin, :scope => :user)
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    review = Review.create(author: "Luigi", content_body: "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums", rating: '5', product_id: product.id)
    visit edit_product_review_path(product, review)
    expect(page).to have_content 'UNAUTHORIZED ACCESS: Please log-in with an admin account to access that resource.'
  end
end