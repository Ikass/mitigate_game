class Player

    attr_accessor :name

    def initialize(name)
        @name = name.capitalize
    end

    def self.from_csv(string)
        name = string
        player = Player.new(name)
    end

    def name=(new_name)
        @name = new_name.capitalize
    end

    def score
        # @health + points
    end

    def to_s
        "I'm #{@name} with a score of #{score}."
    end


end