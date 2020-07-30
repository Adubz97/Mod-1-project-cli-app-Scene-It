require_relative '../config/environment'


puts "Press Y to run Scene It!"
user_input = gets.chomp

if user_input == "Y"
    command = CommandLine.new
end
#binding.pry
option1_input = gets.chomp

if option1_input == "1"
    command.create_account
    puts "\n"
    command.main_menu
elsif option1_input == "2"
    command.login
    puts "\n"
    command.main_menu
end

command.main_menu_choice

