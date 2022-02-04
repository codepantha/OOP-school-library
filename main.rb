# frozen_string_literal: true

require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'
require './logic'

def main
  menu_options = MenuOptions.new

  loop do
    menu_options.display_menu
    user_choice = gets.chomp.to_i

    menu_options.option_handler(user_choice)
    break if user_choice == 7
  end
end

main
