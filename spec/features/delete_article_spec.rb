require "rails_helper"

RSpec.feature "Deleting an Article" do
  
  before do
    john = User.create(email: "jonh@example.com", password: "Password")
    login_as(john)
    @article = Article.create(title: "Title One", body: "Body of article one", user: john)
  end
  
  scenario "A user deletes an article" do
    visit "/"
    
    click_link @article.title
    click_link "Delete Article"
    
    expect(page).to have_content("Article has been destroyed")
    expect(current_path).to eq(articles_path)
  end
end