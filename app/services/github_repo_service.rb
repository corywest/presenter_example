class GithubRepoService
  def initialize(current_user)
    @current_user = current_user
  end

  def user_repos
    github_service.user_repos.map do |user_repo_info|
      UserRepo.new(user_repo_info)
    end
  end

  private

  attr_reader :current_user

  def github_service
    @github_service ||= GithubService.new(current_user)
  end
end
