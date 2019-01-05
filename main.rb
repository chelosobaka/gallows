=begin
  подключаем классы, которые распиханы по файлам.
=end

require_relative 'lib/game_controller'
require_relative 'lib/printer'
require_relative 'lib/word_creator'

game = GameController.new(WordCreator.create_word)

printer = Printer.new(game)

until game.finished?
  printer.clear

  printer.print_input_letter

  printer.processing

  printer.left_errors

  printer.print_status

  printer.ask_letter
  game.ask_letter
end
  printer.clear
  printer.print_status
  printer.print_hangman

