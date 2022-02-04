Dir['./classes/*.rb'].sort.each { |file| require file }
require './logic/logic'

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
