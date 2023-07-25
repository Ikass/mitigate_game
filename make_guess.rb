class MakeGuess 

    attr_reader :guess

    def initialize
        guess
    end
    
    def die_roll
        @gestures = [:rock, :paper, :scissors, :lizard, :spock]
        @gesture = @gestures.sample
    end

end