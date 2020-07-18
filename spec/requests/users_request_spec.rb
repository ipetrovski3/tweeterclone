require 'rails_helper'

RSpec.describe 'Users' do
  it "creates a new user and redirects to the User's page" do
    get new_user_path

    expect(response).to render_template(:new)
  end

  it "Creates new user and redirect to his page" do
    
  end


end
