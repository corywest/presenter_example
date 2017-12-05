class GithubService
  def initialize(current_user)
     @current_user = current_user
  end

  def user_repos
     response = connection.get("/users/#{current_user.nickname}/repos")
     user_repos = JSON.parse(response.body, symbolize_names: true)
  end

  def user_organizations
    response = connection.get("/users/#{current_user.nickname}/orgs")
    user_orgs = JSON.parse(response.body, symbolize_names: true)

    user_orgs.map do |user_org_info|
      UserOrganization.new(user_org_info)
    end
  end

  def user_starred_repos
     response = connection.get("/users/#{current_user.nickname}/starred")
     starred_repos = JSON.parse(response.body, symbolize_names: true)

     starred_repos.map do |starred_repo_info|
       StarRepo.new(starred_repo_info)
     end
  end

  def user_follow_info
    response = connection.get("/users/#{current_user.nickname}/following")
    user_follows = JSON.parse(response.body, symbolize_names: true)

    user_follows.map do |user_follow_info|
      UserFollowInfo.new(user_follow_info)
    end
  end

  def user_followers
    response = connection.get("/users/#{current_user.nickname}/followers")
    user_followers = JSON.parse(response.body, symbolize_names: true)

    user_followers.map do |user_follower_info|
      UserFollowerInfo.new(user_follower_info)
    end
  end

  def user_commits
    response = connection.get("/users/#{current_user.nickname}/events")
    user_commits = JSON.parse(response.body, symbolize_names: true)

    user_commits.map do |user_commit_info|
      UserCommit.new(user_commit_info)
    end
  end

  private

  attr_reader :current_user

  def connection
    @connection ||= Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end
  end
end
