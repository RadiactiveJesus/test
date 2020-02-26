# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post Management' do
  scenario 'create new post' do
    register_user('uac3@gmail.com')
    visit new_post_path
    fill_in 'post_content', with: 'Post content'
    click_button 'Post'
    expect(page).to have_content('Post successfully created')
  end

  scenario 'edit post' do
    sign_in_user('uac3@gmail.com')
    visit new_post_path
    fill_in 'content', with: 'a new post'
    click_on 'Edit'
    fill_in 'Edit post', with: 'an updated post'
    click_on 'Post'
    expect(page).to have_content('Post successfully edited')
  end

  scenario 'delete post' do
    sign_in_user('uac3@gmail.com')
    fill_in 'post_content', with: 'a new post'
    click_on 'Delete'
    expect(page).to have_content('Post deleted')
  end
end
