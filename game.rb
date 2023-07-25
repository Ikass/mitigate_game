require_relative "make_guess"

class Game

    def initialize
        # @gestures = [:rock, :paper, :scissors, :lizard, :spock]
        @players = [ "User", "Computer"]
        @rounds_to_play = 3
        @score = {player: 0, computer: 0}
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

    def die_roll
        # @gesture = @gestures.sample
    end

    def keep_score
        @score = {player: 0, computer: 0}
    end

    def print_stats
        puts "\nGame score:" + "\n"
        @score.each_pair {|key,value| puts "#{key}".capitalize + ": #{value}"}
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