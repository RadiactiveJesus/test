# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'
RSpec.describe 'post managments', type: :feature do
  scenario 'posts have Posts index' do
    visit posts_path
    sleep(2)
    expect(page).to have_content('Posts')
  end
end
