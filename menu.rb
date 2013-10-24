class Menu
  attr_accessor :text_to_show, :choice

  def initialize(text_to_show)
    @text_to_show = text_to_show
    @choice = ""
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def display_menu
    puts text_to_show 
    self.choice = gets.chomp.to_i
    clear_screen
  end

  def login_prompt(userlist)
    puts "Log In".center(TERM_WIDTH, " ")
    puts "Enter username:".center(TERM_WIDTH, " ")
    log_in_as = gets.chomp.downcase
    founduser = userlist.check_for_user(log_in_as)
    if founduser == nil then
      puts "Username \"#{log_in_as}\" not found, please register a new account."
      gets.chomp
      return nil
    else
      return founduser
    end
  end

  def register_prompt(userlist)
    puts "Registering New Account".center(TERM_WIDTH, " ")
    puts "Enter desired username:".center(TERM_WIDTH, " ")
    log_in_as = gets.chomp.downcase
    if userlist.check_for_user(log_in_as) == nil then
      puts "What's your given name?"
      fname = gets.chomp
      puts "To which house do you belong?"
      house = gets.chomp
      puts "Where do you live?"
      whereabouts = gets.chomp
      puts "What's your e-mail address?"
      email = gets.chomp
      puts "How wealthy are you, on a scale of 1 to 10?"
      wealth = gets.chomp.to_i
      userlist.create_user(log_in_as,fname,house,whereabouts,email,wealth)
      puts "Registration successful!"
      gets.chomp
    else
      puts "Username already exists, please try a different username."
      gets.chomp
    end
  end

  def delete_prompt(userlist)
    puts "Deleting User (are you sure?)".center(TERM_WIDTH, " ")
    puts "Enter username to remove:".center(TERM_WIDTH, " ")
    user_to_delete = gets.chomp.downcase
    if userlist.check_for_user(user_to_delete) != nil then
      userlist.delete_user(user_to_delete)
    else
      puts "Username not found."
    end
  end
end