class DashboardController < ApplicationController
  def index
    @user_repo_presenter = UserRepoPresenter.new(current_user)
    @star_repo_presenter = StarRepoPresenter.new(current_user)
  end
end
