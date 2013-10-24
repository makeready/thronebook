class Userlist
  attr_accessor :users
  def initialize
    @users = [] 
  end

  def list_users(login=nil)
    puts "   Name--------House-------Location--------Email"
    puts
    users.size.times do |user|
      puts (user+1).to_s + ") " + users[user].fname.ljust(12) + users[user].house.ljust(12) + users[user].whereabouts.ljust(16) + users[user].email
    end
    choice = gets.chomp
    clear_screen
    users[(choice.to_i)-1].show_user unless choice == ""
  end

  def sort_users(sortby)
    case sortby
    when "name"
      users.sort!{|a,b| a.fname <=> b.fname}
    when "house"
      users.sort!{|a,b| a.house <=> b.house}
    when "location"
      users.sort!{|a,b| a.whereabouts <=> b.whereabouts}
    when "email"
      users.sort!{|a,b| a.email <=> b.email}
    when "wealth"
      users.sort!{|a,b| b.wealth <=> a.wealth}
    when "thronescore"
      users.sort!{|a,b| b.thronescore <=> a.thronescore}
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def game_of_thronebook
    sort_users("thronescore")
    puts users[0].fname + " " + users[0].house + " has the most influence and is the winner of the game of thrones!"
    gets.chomp
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
      return user if user.username == log_in_as
    end
    return nil
  end
end