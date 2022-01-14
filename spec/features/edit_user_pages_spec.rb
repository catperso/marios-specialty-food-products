require 'rails_helper'

describe "the Edit A User Account process" do

  it "changes the email associated with the account" do
    user = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus')
    login_as(user, :scope => :user)
    visit '/'
    click_on 'Edit Account'
    fill_in 'Email', :with => "Bappy@Cara.com"
    fill_in 'Current password', :with => 'epicodus'
    click_on 'Update'
    expect(page).to have_content "Your account has been updated successfully."
  end

end