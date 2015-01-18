require 'rails_helper'

feature 'homepage' do
  scenario 'should display options bar' do
    visit '/'
    expect(page).to have_link 'HOME'
    expect(page).to have_link 'ABOUT'
    expect(page).to have_link 'CONTACT'
    expect(page).to have_link 'ALL POSTS'
  end
end