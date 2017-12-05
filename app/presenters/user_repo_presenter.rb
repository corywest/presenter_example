class UserRepoPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def display_user_repos
    github_service.user_repos
  end

  def display_updated_date(repo)
    formatted_repo_date = DateTime.parse(repo.updated_at)
    formatted_repo_date.strftime("Last updated on %m/%d/%Y")
  end

  def display_titlelized_name(repo_name)
    repo_name.titleize
  end

  def display_upcase_repo_name(repo_name)
    repo_name.upcase
  end

  def display_user_repo_count
    github_service.user_repos.count
  end

  private

  attr_reader :current_user

  def github_service
    @github_service ||= GithubRepoService.new(current_user)
  end
end
