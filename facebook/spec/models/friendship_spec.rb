# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Tests of table relatioships' do
    describe 'Associations' do
      it 'user can belong to other user' do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it 'user can belong to other user' do
        assc = described_class.reflect_on_association(:friend)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end
end
