require_relative 'lib/game_controller'
require_relative 'lib/printer'

game = GameController.new
printer = Printer.new(game)

loop do
  printer.print_game
  game.ask_letter
end


