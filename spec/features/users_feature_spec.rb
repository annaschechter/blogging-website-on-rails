require 'rails_helper'

feature 'users' do 
  before do
    Post.create(text: "Welcome to my blog")
    admin = User.create(email: "anna@test.com", password: "passwordanna")
    admin.add_role :admin
    user = User.create(email: "bob@test.com", password: "passwordbob")
  end

  def sign_in(email, password)
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  context 'non admin users' do
    scenario 'cannot see link "NEW POST"' do
      sign_in("bob@test.com", "passwordbob")
      visit '/posts'
      expect(page).not_to have_link('NEW POST')
    end

    scenario 'cannot see link "DELETE"' do
      sign_in("bob@test.com", "passwordbob")
      visit '/posts'
      click_link 'READ MORE'
      expect(page).not_to have_link('DELETE')
    end

    scenario 'cannot see link "EDIT"' do
      sign_in("bob@test.com", "passwordbob")
      visit '/posts'
      click_link 'READ MORE'
      expect(page).not_to have_link('EDIT')
    end
  end

  context 'admin users' do
    scenario 'can see link "NEW POST"' do
      sign_in("anna@test.com", "passwordanna")
      visit '/posts'
      expect(page).to have_link('NEW POST')
    end

    scenario 'can see link "DELETE"' do
      sign_in("anna@test.com", "passwordanna")
      visit '/posts'
      click_link 'READ MORE'
      expect(page).to have_link('DELETE')
    end

    scenario 'can see link "EDIT"' do
      sign_in("anna@test.com", "passwordanna")
      visit '/posts'
      click_link 'READ MORE'
      expect(page).to have_link('EDIT')
    end
  end
  
end