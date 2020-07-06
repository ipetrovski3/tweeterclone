require 'rails_helper'

RSpec.describe Tweet do
  describe 'associations' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to belong_to(:user)}

    describe 'dependency' do
      let(:count) { 1 }
      let(:tweet) { create(:tweet) }

      it 'destroys comments' do
        create_list(:comment, count, tweet: tweet)

        expect { tweet.destroy }.to change { Comment.count }.by(-count)
      end
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
