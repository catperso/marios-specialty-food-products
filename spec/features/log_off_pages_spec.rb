require 'rails_helper'

describe "the Logging Off process" do
  it "logs out of the current user account" do
    user = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus')
    login_as(user, :scope => :user)
    visit '/'
    click_on 'Sign Out'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end