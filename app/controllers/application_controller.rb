class ApplicationController < ActionController::Base
  include SessionsHelper

  # before_action :require_login

  private

  def require_login
    redirect_to login_path
  end
end
