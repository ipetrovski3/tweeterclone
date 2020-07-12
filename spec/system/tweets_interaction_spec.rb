require 'rails_helper'

RSpec.describe 'TweetsInteraction' do
  let(:user) { create(:user) }
  before do
    driven_by :selenium, using: :chrome

    log_in(user)
    # visit tweet_path(tweet)
  end

  describe 'Creating an tweet' do
    it 'creates and shows the newly created tweet' do
    
      click_on 'New tweet '

      within('form') do
        fill_in 'Title', with: title
        fill_in 'Body', with: body

        click_on 'Save Tweet'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(body)
    end
  end

  describe 'Editing an tweet' do

  end
  
  describe 'Deleting a tweet' do

  end

  describe 'Creating tweet comments' do

  end

  describe 'Going back to tweet index page' do
  end
end
