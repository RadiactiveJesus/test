# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it 'belongs_to user' do
      assc = described_class.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end
    it 'has_many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
    it 'has_many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end
  context 'Validations' do
    before :each do
      @user = create(:user)
      @auth = log_in @user
      @post = create(:post, user_id: @user.id)
    end
    it 'returns true if the form successfully achieves all the validations' do
      @post.content = 'Anything'
      @post.user = event_creator
      expect(subject).to be_valid
    end
    it 'returns true if the form doesnt have a content' do
      expect(subject).to_not be_valid
    end
  end
end
