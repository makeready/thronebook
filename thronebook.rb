require_relative "menu"
require_relative "user"
require_relative "userlist"

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
                               5.      Sort users
                               6.  Game of Thronebook
                               7.         Quit








))

user_menu = Menu.new(%Q(








                                     USER MENU
                               1.   Show Friends
                               2.    Add Friend
                               3.   Edit Profile
                               4. Back to Main Menu
                               








))

edit_menu = Menu.new(%Q(








                                    EDIT PROFILE
                               1.   Change username
                               2.   Change name
                               3.   Change location
                               4.   Change wealth
                               5.   Back to user menu
                               







))

rolodex = Userlist.new
#                    username        fname      house       whereabouts      email                            wealth friends
rolodex.create_user("danaeryst",     "Danaerys","Targaryen","Essos",         "mother_of_dragons@yahoo.com",   8,     ["littlebirds"])
rolodex.create_user("jonsnow",       "Jon",     "Snow",     "Castle Black",  "jon_snuuuuuu@gmail.com",        6)
rolodex.create_user("queencersei",   "Cersei",  "Lannister","King's Landing","myfathersdaughter@hotmail.com", 10)
rolodex.create_user("theimp",        "Tyrion",  "Lannister","King's Landing","tyrion_lannister@gmail.com",    10,    ["littlebirds","queencersei","littlefinger"])
rolodex.create_user("valarmorghulis","Arya",    "Stark",    "not telling",   "valarmorghulis@hushmail.com",   1)
rolodex.create_user("littlebirds",   "Varys",   "????",     "King's Landing","thespider@gmail.com",           7,     ["danaeryst","queencersei","theimp"])
rolodex.create_user("hodor",         "Hodor",   "HODOR",    "hodor",         "Hodor",                         1,     ["jonsnow","valarmorghulis"])
rolodex.create_user("littlefinger",  "Petyr",   "Baelish",  "King's Landing","master-of-the-coin@hotmail.com",9,     ["littlebirds"])

TERM_WIDTH = 80

castle_art.display_menu

until main_menu.choice == 7 do  
  main_menu.display_menu
  case main_menu.choice
  when 1
    login = main_menu.login_prompt(rolodex)
    unless login == nil then 
      until user_menu.choice == 4 do
        user_menu.display_menu
        case user_menu.choice
        when 1
          rolodex.list_users(login,"friends")
        when 2
          rolodex.list_users(login,"non-friends")
        when 3
          until edit_menu.choice == 5 do
            edit_menu.display_menu
            case edit_menu.choice
            when 1
              edit_menu.edit_prompt(login, "username")
            when 2
              edit_menu.edit_prompt(login, "name")
            when 3
              edit_menu.edit_prompt(login, "location")
            when 4
              edit_menu.edit(login, "wealth")
            end
          end
          edit_menu.choice = ""
        end
      end
      user_menu.choice = ""
    end
  when 2
    main_menu.register_prompt(rolodex)
  when 3
    main_menu.delete_prompt(rolodex)
  when 4
    rolodex.list_users
  when 5
    main_menu.sort_prompt(rolodex)
  when 6
    rolodex.game_of_thronebook
  end   
end

puts "What is dead may never die...".center(TERM_WIDTH, " ")
puts
