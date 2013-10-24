#Problem - I want the user to be able to construct their own User instance,
#with the users array in Userlist containing all those created instances.

class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Userlist
  attr_accessor :users
  def initialize
    @users = [] 
  end

  def create_user(name)
    users << User.new(name)
    #is it better to generate a human-readable name for the new User instance?
  end
end

my_userlist = Userlist.new

5.times do
  puts "registering new user. what's your name?"
  name = gets.chomp
  my_userlist.create_user(name)
end

my_userlist.users.each do |user|
  puts "there goes the neighbourhood" if user.name == "greg"
end

puts "Here are the names of the user instances:"
puts my_userlist.users