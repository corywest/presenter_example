class UserCommit
  attr_reader :blah
  
  def initialize(info)
    @blah = info[:blah]
  end
end
