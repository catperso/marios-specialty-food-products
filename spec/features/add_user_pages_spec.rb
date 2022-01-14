require 'rails_helper'

describe "the Add New User process" do

  it "signs up for a new account" do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', :with => "Capy@Bara.com"
    fill_in 'Password', :with => "epicodus"
    fill_in 'Password confirmation', :with => "epicodus"
    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end