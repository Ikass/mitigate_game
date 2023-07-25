require_relative "make_guess"
require_relative "player"
require 'csv'

class Game

    def initialize
        @players = ["TheAverageForumUser", "WookiesrPpl2", "HogwartsFailure"]
        @rounds_to_play = 3
        @score = {}
    end
 
    # Game rules or winning conditions as a Hash - can easily be modified or expanded
    def win_conditions 
        {
            rock: [:scissors, :lizard],
            paper: [:rock, :spock],
            scissors: [:paper, :lizard],
            lizard: [:spock, :paper],
            spock: [:scissors, :rock]
        }
    end

    def add_player(player)
      @players << player
    end

    def add_players(number_of_players)
        1.upto(number_of_players) do |player|
            @players << player
        end
    end

    def die_roll
        # @gesture = @gestures.sample
    end

    def keep_score
        # @score = {player: 0, computer: 0}
    end

    def print_stats
        puts "\nGame score:" + "\n"

        # sort game scores by value
        @high_scores = @score.sort_by {|k, v| -v}
        @high_scores.each {|key,value| puts "#{key}".capitalize + ": #{value}"}

        # test for a tie result
        # assign winner from the game scores
        unless @high_scores[0][1] == @high_scores[1][1]
            winner = @high_scores[0]
            puts "The winner is #{winner[0].capitalize} with a score of #{winner[1]}!"
        else
            puts "It's a tie!"
        end
    end

    def take_turn(player)
        # @guess = die_roll
        puts "#{player} guess: #{@guess}."
    end

    def winner_is(my_guess, computer_guess)
        puts "Player guess:" + "#{@my_guess}.".rjust(17, '.')
        puts "Computer guess:" + "#{@computer_guess}.".rjust(15, '.')
        if win_conditions[computer_guess].include?(my_guess)
            puts "Computer wins!".center(30, ".") + "\n"
            @score[:computer] += 1
        elsif win_conditions[my_guess].include?(computer_guess)
            puts "You win!".center(30, ".") + "\n"
            @score[:player] += 1
        else
            puts "Tie.".center(30, ".") + "\n"
        end
    end

    def play

        puts "\n" + "Let's play 'Rock, Paper, Scissors, Lizard, Spock!".center(60, ".") + "\n"

      1.upto(@rounds_to_play) do |round|
        puts "\nRound #{round}:".ljust(31, '.')
        @my_guess = MakeGuess.new.guess
        @computer_guess = MakeGuess.new.guess
        winner_is(@my_guess, @computer_guess)
      end

      print_stats

    end

end

new_game = Game.new.play