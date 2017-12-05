class UserRepo
  attr_reader :name, :updated_at

  def initialize(info)
    @name = info[:name]
    @updated_at = info[:updated_at]
  end
end
