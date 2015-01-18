require 'rails_helper'

feature 'homepage' do
  scenario 'should display options bar' do
    visit '/'
    expect(page).to have_link 'HOME'
    expect(page).to have_link 'ABOUT'
    expect(page).to have_link 'CONTACT'
    expect(page).to have_link 'ALL POSTS'
  end

  scenario 'should allow users to navigate to home page' do
    visit '/'
    click_link('HOME')
    expect(current_path == root_path).to be true
  end

  scenario 'should allow users to navigate to about page' do
    visit '/'
    click_link('ABOUT')
    expect(current_path == about_path).to be true
  end

  scenario 'should allow users to navigate to contact page' do
    visit '/'
    click_link('CONTACT')
    expect(current_path == contact_path).to be true
  end

end