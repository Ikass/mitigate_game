class Score

    def initialize
        @scores = Hash.new(0)
    end

    def add_score(player)
        @scores[:player] =+ 1
    end

    def print_stats(player)
        puts @scores
    end

end