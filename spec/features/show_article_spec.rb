require "rails_helper"

RSpec.feature "Showing an article" do
  
  before do
    @john = User.create(email: "john@example.com", password: "Password")
    @fred = User.create(email: "fred@example.com", password: "Password")
    @article = Article.create(title: "The first article", body: "Lorem Ipsum Dolor Sit Amet, Consectetur.", user: @john)
  end
  
  scenario "to non-signed in user, hide the Edit and Delete buttons" do
    visit "/"
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to non-owner, hide the Edit and Delete buttons" do
    login_as(@fred)
    visit "/"
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

end