require 'rails_helper'

describe "the Log In process" do
  it "logs into an existing account" do
    user = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus')
    visit '/'
    fill_in "Email", :with => 'Capy@Bara.com'
    fill_in "Password", :with => 'epicodus'
    click_on 'Log in'
    expect(page).to have_content "Signed in successfully."
  end
end