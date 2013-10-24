class Userlist
  attr_accessor :users
  def initialize
    @users = []
    @usercount = 0 
  end

  def list_users(login=nil, sort=nil)
    puts "   Name--------House-------Location--------Email"
    puts
    users.size.times do |user|
      puts (user+1).to_s + ") " + users[user].fname.ljust(12) + users[user].house.ljust(12) + users[user].whereabouts.ljust(16) + users[user].email
    end
    gets.chomp
  end

  def game_of_thronebook
  end

  def create_user(*args)
    users << User.new(*args)
  end

  def delete_user(user_to_delete)
    users.each do |user|
      users.delete(user) if user.username == user_to_delete
    end
  end

  def check_for_user(log_in_as)
    users.each do |user|
      return user.username if user.username == log_in_as
    end
    return nil
  end
end