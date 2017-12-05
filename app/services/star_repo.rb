class StarRepo
  attr_reader :name, :stargazers_count

  def initialize(info)
    @name = info[:name]
    @stargazers_count = info[:stargazers_count]
  end
end
