require 'rails_helper'

RSpec.describe User do
  context 'when saving' do
    it 'transform email to downcase' do
      user = create(:user, email: 'IGOR@IGOR.COM')

      expect(user.email).to eq 'igor@igor.com'
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:tweets) }
    it { is_expected.to have_many(:comments) }

    describe 'dependency' do
      let(:count) { 1 }
      let(:user) { create(:user)}

      it 'destroys comments' do
        create_list(:comment, count, user: user)

        expect { user.destroy }.to change { Comment.count }.by(-count)
      end

      it 'destroys tweets' do
        create_list(:tweet, count, user: user)

        expect { user.destroy }.to change { Tweet.count }.by(-count)
      end
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_secure_password }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_length_of(:email).is_at_most(50) }



    context 'when matching uniqueness of email' do
      subject { create(:user)}

      it { is_expected.to validate_uniqueness_of(:email) }
    end

    context 'when using invalid email format' do
      it 'is invalid' do
        user = build(:user, email: 'test@invalid')

        expect(user.valid?).to be false
      end
    end
  end
end
