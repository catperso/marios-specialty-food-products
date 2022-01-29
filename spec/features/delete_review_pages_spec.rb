require 'rails_helper'

describe "the Delete a Review process" do

  before(:each) do
    @product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    @review = Review.create(author: "Luigi", content_body: "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums", rating: '5', product_id: @product.id)
  end

  it "deletes a review" do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
    visit product_review_path(@product, @review)
    click_on 'Delete this review'
    expect(page).to have_no_content "Luigi"
    expect(page).to have_content "Review removed successfully!"
  end

  it "is unavailable for non-admin users" do
    user = User.create!(email: 'bappy@cara.com', password: 'epicodus', admin: false)
    login_as(user, scope: :user)
    visit product_review_path(@product, @review)
    expect(page).to have_no_content 'Delete this review'
  end
end