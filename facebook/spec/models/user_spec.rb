# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Tests of table relatioships' do
    describe 'Associations' do
      it 'user has many posts' do
        assc = User.reflect_on_association(:posts)
        expect(assc.macro).to eq :has_many
      end
    end
  end

  context 'Validations' do
    subject { User.create }
    it 'returns true if the form successfully achieves all the validations' do
      subject.first_name = 'Anything'
      subject.last_name = 'Anythinglastname'
      subject.email = 'Anything@example.com'
      subject.password = 'anything'
      expect(subject).to be_valid
    end
    it 'returns true if the form doesnt have a first name' do
      expect(subject).to_not be_valid
    end
    it 'returns true if the form doesnt have a email' do
      subject.first_name = 'Anything'
      expect(subject).to_not be_valid
    end
    it 'returns true if the form doesnt have a last name' do
      subject.first_name = 'Anything'
      subject.email = 'Anything@example.com'
      expect(subject).to_not be_valid
    end
  end
end
