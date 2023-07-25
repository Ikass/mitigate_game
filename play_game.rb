require_relative 'game'

new_game = Game.new.play_game
# default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
# new_game.load_players(ARGV.shift || default_player_file)

loop do
  puts "\nHow many players? (from 1 to 9)"
  number_of_players = gets.chomp.downcase.to_i
  new_game.add_players(number_of_players)
  puts @players

  puts "\nHow many rounds? (from 1 to 5)"
  number_of_rounds = gets.chomp.downcase.to_i
#   game.rounds_to_play(number_of_rounds.to_i)
#   new_game.rounds_to_play = number_of_rounds.to_i
  new_game.play(number_of_rounds.to_i)
  new_game.print_stats

end