class User
  attr_accessor :name, :house, :whereabouts, :email, :wealth, :username
  def thronescore
  end
end

class Userlist
  attr_accessor :users
  def initialize
    @users = []
  end

  def list_users(login)
  end

  def game_of_thronebook
  end

  def create_user
  end

  def delete_user
  end
end

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
    self.clear_screen
  end

  def login_prompt(userlist)
    puts "Log In".center(TERM_WIDTH, " ")
    puts "Enter username:".center(TERM_WIDTH, " ")
    log_in_as = gets.chomp.downcase
    userlist.users do |user|
      return user.username if user.username == log_in_as
    end
    puts "Username not found, please register a new account."
    gets.chomp
    return nil
  end

  def register_prompt(userlist)
    puts "Registering New Account".center(TERM_WIDTH, " ")
    puts "Enter desired username:".center(TERM_WIDTH, " ")
    test_un = gets.chomp.downcase
    #check if un already exists
  end

  def delete_prompt(userlist)
    puts "Deleting User (are you sure?)".center(TERM_WIDTH, " ")
    puts "Enter username to remove:".center(TERM_WIDTH, " ")
    remove_un = gets.chomp.downcase
  end
end









def list_contacts(logged_in_as,user_to_list,sort_by)
end

def add_friend(logged_in_as)
end

def suggest_friend(logged_in_as)
end

def add_enemy(logged_in_as)
end

def suggest_enemy(logged_in_as)
end

def show_user_profile(logged_in_as,selected_user)
end

def edit_user_profile(logged_in_as)
end

def edit_name(logged_in_as)
end

def edit_house(logged_in_as)
end

def edit_whereabouts(logged_in_as)
end

def edit_email(logged_in_as)
end

def edit_wealth(logged_in_as)
end

def quick_add_contact(attributes)  #pass a hash to this
end

def save_contact
end

def load_contacts_and_rolodexi
end

castle_art = Menu.new(%Q(
.................T..............................................................
................[+]===_==.......................................................
.................|^^||^^|.....................==========================........
..............T.+|^#||^^|.....................|                        |........
..............|.|^^^||^^|.....................|       THRONEBOOK       |........
..............[=]^^^||==]..T..................|                        |........
.............T+.|^^^||##[n||||................| YOU NETWORK OR YOU DIE |........
.............||.|#^^||==||^^^|................|    *    *    *    *    |........
.............|[T+TT]####||###=|...P...........==========================........
.............|[=+==]||##++]|++|TT.O...P.........................................
.............||.|^^^||^^##^^^|^^|T#..TT...... <--------kings landing obvi.......
.............||.|^^^^^#^^^+++]^^|^^T^^|..TTT....................................
.............||.|^#^^^^^^^^^^######|#######|====n...............................
...........++||.|^^^^^^^^^^^^^^^^^^|^##^^^^[####|_____TT........................
.....++++++++||.|^^#^^^^^^^##^^^^^^^^^^^^^^^^^^^^======|........................
+==+===+===~~||.|_^^^^^:^,#^^^:^:^~^^,,^^,^^#,,^^#^^,,^^........................
::::::::~^:^:||#^^^:,:,:,,,,^:#~:,^::#,::^:~,::,~~~:::===============___________
~~~~~~~~~^:,,||^^^,,,:~##:~:,,:::::,:,,,,,,,#^::,,,,,::~,,:::::,:,~~,^^^^^^^^^^^
~~~~~~~~^,^.,,,::#,,,::,^^^,::,::::^::,,::,,,,,,,^^,,,:,,,,,#,,,,,,^:^^^^^^^^^^^
~~^^^^^^::,,,:^,,,,,#:,,,::#:,,:,:,,:::::,,^^:,,,,,,,,,,,,,,,^,,,,,,============
~~~~~~~^:#::^,,,,,,:,^,,,,::,,,,::^,,_,^,_,,,,,#,_,,,^,,,,,,^,,,,,~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~PRESS~ENTER~TO~CONTINUE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~))

main_menu = Menu.new(%Q(







                                       MAIN MENU
                               1.    Log in as user
                               2. Register New Account
                               3.     Delete user
                               4.      List users
                               5.  Game of Thronebook
                               6.         Quit








))

user_menu = Menu.new(%Q(







                                      USER MENU
                               1.   List contacts
                               2.    Add Friend
                               3.     Add Enemy
                               4.    Edit Profile
                               5. Back to Main Menu
                               








))

rolodex = Userlist.new

TERM_WIDTH = 80

castle_art.display_menu

puts "Loading userdata..."
#Load all existing userinfo

until main_menu.choice == 6 do  
  main_menu.display_menu
  case main_menu.choice
  when 1
      login = main_menu.login_prompt(rolodex)
      unless login == nil then 
        until user_menu.choice == 5 do
          user_menu.display_menu
          case user_menu.choice
          when 1
            rolodex.list_users(login)
          when 2
            #add friend
          when 3
            #add enemy
          when 4
            #edit profile
          end
        end
        user_menu.choice = ""
      end
  when 2
    main_menu.register_prompt(rolodex)
  when 3
    main_menu.delete_prompt(rolodex)
  when 4
    rolodex.list_users(nil)
  when 5
    rolodex.game_of_thronebook
  end   
end

puts "Bye!".center(TERM_WIDTH, " ")


###########SHOW USER PROFILE#
#0. Relationship (select to edit, only show if logged in)
#1. Name
#2. House
#3. Current Whereabouts
#4. Email
#5. Wealth (1-10)
#6. Thronescore (Calculated - Friends + Wealth - Enemies)
#7. List user's contacts

##########EDIT USER PROFILE#
#1. Name
#2. House
#3. Whereabouts
#4. Email
#5. Wealth

