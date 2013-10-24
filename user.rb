class User
  attr_accessor :fname, :house, :whereabouts, :email, :wealth, :username, :friends

  def initialize(username, fname, house, whereabouts, email, wealth, friends = [])
    @username = username
    @fname = fname
    @house = house
    @whereabouts = whereabouts
    @email = email
    @wealth = wealth
    @friends = friends
  end

  def thronescore
    wealth + friends.size - enemies.size
  end
end