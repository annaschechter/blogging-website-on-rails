require 'rails_helper'
feature 'posts' do 
  before do
    Post.create(text: "Welcome to my blog")
  end

  scenario 'are displayed on "all posts" page' do
    visit '/posts'
    expect(page).to have_content('Welcome to my blog')
  end
  
end