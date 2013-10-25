class User
  attr_accessor :username, :fname, :house, :whereabouts, :email, :wealth, :username, :friends

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
    wealth + friends.size
  end

  def show_user
    puts (fname + " " + house).center(80)
    puts "(Username: #{username})".center(80)
    puts "      Location:  #{whereabouts}"
    puts "      Email:     #{email}"
    puts "      Wealth:    #{wealth}"
    puts "      Influence: #{thronescore}"
    gets.chomp
  end

  def add_friend(friend_user)
    self.friends << friend_user.username
  end
end