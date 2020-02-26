# frozen_string_literal: true

require 'rails_helper'

module Helpers
  def register_user(email)
    visit new_user_registration_path
    fill_in 'user[first_name]', with: 'Rodolfo'
    fill_in 'user[last_name]', with: 'Llinas'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
  end

  def sign_in_user(email)
    visit new_user_session_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: '12345678'
    click_button 'Log in'
  end

  def create_post
    fill_in 'Create a post', with: 'Content'
    click_button 'Post'
  end

  def comment_post
    comment = find('#comment_body', match: :first)
    comment.fill_in with: 'a new comment'
    click_button('Comment', match: :first)
  end
end
