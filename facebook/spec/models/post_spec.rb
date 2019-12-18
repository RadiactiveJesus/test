# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Tests of table relationships' do
    describe 'Associations' do
      it 'posts belongs to user' do
        assc = Post.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
  context 'Validations' do
    before :each do
      @user = create(:user)
      sign_in @user
    end
    subject { Post.create }
    it 'returns true if the form successfully achieves all the validations' do
      subject.content = 'Anything'
      subject.user = event_creator
      expect(subject).to be_valid
    end
    it 'returns true if the form doesnt have a content' do
      expect(subject).to_not be_valid
    end
  end
end
