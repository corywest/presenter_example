class DashboardPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def display_user_organizations
    github_service.user_organizations
  end

  def display_user_following_list
    github_service.user_follow_info
  end

  def display_user_followers
    github_service.user_followers
  end

  def display_user_commits
    github_service.user_commits
  end

  private

  attr_reader :current_user

  def github_service
    @github_service ||= GithubService.new(current_user)
  end
end
