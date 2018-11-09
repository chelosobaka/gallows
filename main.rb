require_relative 'lib/game_controller'
require_relative 'lib/printer'
require_relative 'lib/word_creator'

game = GameController.new(WordCreator.create_word)
printer = Printer.new(game)

loop do
  printer.print_game
  game.ask_letter
end


