class WelcomeController < ApplicationController
  def index
    return unless current_user

    redirect_to groups_path
  end
end
