require_relative "make_guess"

class Player

    attr_accessor :name, :score

    def initialize(name)
        @name = name
        @score = 0
    end

    def make_guess
        @guess = MakeGuess.new.die_roll
    end

    def add_score
        @score += 1
    end

    def to_s
        "I'm #{@name} with a score of #{score}."
    end

    # players wins, if beats all 3 pc_players
    def won?
        @score == 3
    end


end