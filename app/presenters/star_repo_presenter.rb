class StarRepoPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def display_user_starred_repos
    github_service.user_starred_repos
  end

  def display_user_starred_repo_count
    github_service.user_starred_repos.count
  end

  private

  attr_reader :current_user

  def github_service
    @github_service ||= GithubService.new(current_user)
  end
end
