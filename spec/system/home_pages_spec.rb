require 'rails_helper'

RSpec.describe "HomePages", type: :system do
  before do
    driven_by :selenium, using: :headless_chrome

    visit root_path
  end

  it 'show the home link' do

    expecting = page.has_link?
    expect(expecting).to be true
  end

  context 'when no user is sign in' do
    it 'show the Login button' do
      expecting = page.has_link?('Login')
      expect(expecting).to be true
    end

    it 'show the Sign Up button' do
      expecting = page.has_link?('Sign Up')
      expect(expecting).to be true
    end
  end

  context 'when user is sign in' do
    it 'shows new tweet button' do
      user = create(:user)
      visit login_path

      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password

        click_on 'Log in'
      end

      expecting = page.has_link?('New tweet')
      expect(expecting).to be true

      expecting = page.has_link?(user.name)
      expect(expecting).to be true

      visit root_path
    end
  end

  context 'when tweet is present' do
    let!(:tweet) { create(:tweet, title: 'Testing with RSpec') }
    before do
      visit root_path
    end

    it 'shows the tweet title' do
      expect(page.has_content?(tweet.title)).to be true
    end

    it 'shows the link to the tweet' do
      expect(page.has_link?(tweet.title)).to be true
    end
  end
end
