require_relative "make_guess"
require_relative "player"

class Game

    def initialize
        @rounds_to_play = 3
        @user_player = Player.new("User")
        @players = []
        add_players
    end
 
    # Game rules or winning conditions as a Hash - can easily be modified or expanded
    def game_rules 
        {
            rock: [:scissors, :lizard],
            paper: [:rock, :spock],
            scissors: [:paper, :lizard],
            lizard: [:spock, :paper],
            spock: [:scissors, :rock]
        }
    end

    def add_players
        pc_player_names = ["TheAverageForumUser", "WookiesrPpl2", "HogwartsFailure"]
        pc_player_names.each do |name|
            @players << Player.new(name)
        end
    end

    def print_stats
        puts "\nGame score:" + "\n"
        puts "The number of games you won: #{@user_player.score}"
        if @user_player.won?
            puts "YOU WON ALL 3 GAMES!!"
        end
    end

    def play_game
        puts "\n".ljust(61, '=')
        puts "Let's play 'Rock, Paper, Scissors, Lizard, Spock!".center(60, ".")
        puts "".ljust(60, '=')

        # User vs all 3 PC players
        @players.each do |pc_player|
            game_scores = {:user_player => 0, :pc_player => 0}
            puts "\n".ljust(60, '-')
            puts "#{@user_player.name.capitalize} plays against #{pc_player.name}".center(59, '.')
            play_rounds(pc_player, game_scores)
            if game_scores[:user_player] > game_scores[:pc_player] 
                puts "You won the game!"
                @user_player.score += 1; 
            else
                puts "You lost.."
            end
        end

        print_stats

    end

    # play the defined number of rounds
    def play_rounds(pc_player, game_scores)
        1.upto(@rounds_to_play) do |round|
            puts "\nRound #{round}:".ljust(42, '.')
            # user_player makes a guess
            @user_guess = @user_player.make_guess
            puts "User guess:".ljust(30, '.') + "#{@user_guess}"
            # pc_player makes a guess
            @pc_guess = pc_player.make_guess
            puts "#{pc_player.name} guess:".ljust(30, '.') + "#{@pc_guess}"
            winner_is(@user_guess, @pc_guess, pc_player, game_scores)
            puts game_scores
      end
    end

    # check winner for each Round
    def winner_is(user_guess, pc_guess, pc_player, game_scores)
        if game_rules[pc_guess].include?(user_guess)
            puts "Computer wins!".center(30, ".") + "\n"          
            game_scores[:pc_player] += 1; 
        elsif game_rules[user_guess].include?(pc_guess)
            puts "You win!".center(30, ".") + "\n"
            game_scores[:user_player] += 1; 
        else
            puts "Tie.".center(30, ".") + "\n"
        end
    end

end

new_game = Game.new.play_game