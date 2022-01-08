require 'rails_helper'

describe "the Edit a Review process" do
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
end