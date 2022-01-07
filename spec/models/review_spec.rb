require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_least(50).is_at_most(250) }
  it { should validate_presence_of :rating }
  it { should validate_numericality_of(:rating).is_greater_than(0).is_less_than(6)}

  it("titleizes the author of a review") do
    product = Product.create({name: "vegan turkey dumplings", cost: 12, country_of_origin: "USA"})
    review = Review.create({author: "boophis q. doulioti", content_body: "cdtsugxmtinyzvvavhoxdyqsscrnqoytcxqgekwvhshwprykauldqdivtgneerfeeljnr", rating: 5, product_id: product.id})
    expect(review.author).to(eq("Boophis Q. Doulioti"))
  end
end