require 'rails_helper'
feature 'posts' do 
  before do
    Post.create(text: "Welcome to my blog")
  end

  scenario 'are displayed on "all posts" page' do
    visit '/posts'
    expect(page).to have_content('Welcome to my blog')
  end

  scenario 'user can add posts, which are the displayed on "all posts" page' do
    visit '/posts'
    click_link 'NEW POST'
    fill_in 'Text', with: 'This is my second post'
    click_button 'Post'
    expect(page).to have_content('This is my second post')
  end

  scenario 'users can view individual posts' do
    visit '/posts'
    click_link 'READ MORE'
    expect(page).to have_content('Welcome to my blog')
  end
  
end