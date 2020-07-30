require_relative '../config/environment'

#binding.pry


puts "Press any key to run Scene It! Type 'exit' to exit program."
user_input = gets.chomp
if user_input == "exit"
    exit
else
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
else
    puts "Please enter 1 or 2"
    exit
end

command.main_menu_choice

