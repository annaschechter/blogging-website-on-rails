require 'rails_helper'

feature 'comments' do 

  def sign_in(email, password)
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  before do
    Post.create(text: "Welcome to my blog")
    # admin = User.create(email: "anna@test.com", password: "passwordanna")
    # admin.add_role :admin
    user = User.create(email: "bob@test.com", password: "passwordbob")
    sign_in("bob@test.com", "passwordbob")
  end

  scenario 'users can comment on posts' do
    visit '/posts'
    click_link 'COMMENT'
    fill_in 'Text', with: "This is my comment"
    click_button 'Comment'
    expect(page).to have_content('This is my comment')
  end
end