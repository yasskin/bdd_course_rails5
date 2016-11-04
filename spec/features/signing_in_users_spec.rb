require "rails_helper"

RSpec.feature "Sign in user" do
  
  before do
    @john = User.create!(email: "john@example.com", password: "Password")
  end
  
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in succcessfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end
  
  scenario "with invalid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Log in"
    
    expect(page).to have_content("You have not signed in successfully.")
  end
  
end
