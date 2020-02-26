# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'login or sign up ' do
  scenario 'visit and sign in' do
    visit '/users/sign_in'
    within 'div#signin-form-wrap' do
      fill_in 'user[email]', with: 'kofi@gmail.com'
      fill_in 'user[password]', with: 'qwertyuiop'

      click_on 'Log In'

      expect(page).to have_content('Home#index')
    end
  end

  scenario 'visit and sign up' do
    visit '/users/sign_up'
    within 'div#signup-form-wrap' do
      fill_in 'user[last_name]', with: 'kofi'
      fill_in 'user[first_name]', with: 'ama'
      fill_in 'user[email]', with: 'ama@gmail.com'
      fill_in 'user[password]', with: 'qwertyuiop'

      click_on 'Sign up'

      expect(page).to have_content('Home#index')
    end
  end
end
