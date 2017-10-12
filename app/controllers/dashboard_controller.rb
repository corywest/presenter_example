
class DashboardController < ApplicationController

  def index

    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end

     response = @conn.get("/user")

     @results = JSON.parse(response.body, symbolize_names: true)


     ##queries

     repo_response = @conn.get("/user/repos")
     @repos = JSON.parse(repo_response.body, symbolize_names: true)

     org_response = @conn.get("/users/#{current_user.nickname}/orgs")
     @orgs = JSON.parse(org_response.body, symbolize_names: true)

     basic_info_response = @conn.get("/user")
     @info = JSON.parse(basic_info_response.body)

     starred_response = @conn.get("/users/#{current_user.nickname}/starred")
     @starred = JSON.parse(starred_response.body)

     following_response = @conn.get("/users/#{current_user.nickname}/following")
     following = JSON.parse(following_response.body)
     @list_of_following = following.map do |fol|
       fol["login"]
     end

     followers_response = @conn.get("/users/#{current_user.nickname}/followers")
     followers = JSON.parse(followers_response.body)
     @list_of_followers = followers.map do |fol|
       fol["login"]
     end

     
    #  binding.pry
  end



end
