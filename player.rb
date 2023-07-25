require_relative 'gestures'
require_relative 'playable'

class Player
    include Playable

    attr_accessor :health
    attr_accessor :name
    attr_accessor :points

    def initialize(name)
        @name = name.capitalize
        @found_treasures = Hash.new(0)
    end

    def self.from_csv(string)
        name = string
        player = Player.new(name)
    end

    # total of points from all found treasures
    def points
        @found_treasures.values.reduce(0, :+)
    end

    def found_treasure(treasure)
        @found_treasures[treasure.name] += treasure.points
        puts "#{@name} found a #{treasure.name} worth #{treasure.points}."
        puts "#{@name}'s tresures: #{@found_treasures}"
    end

    def each_found_treasure
        @found_treasures.each do |name, points|
        yield Treasure.new(name, points)
        end
    end

    def name=(new_name)
        @name = new_name.capitalize
    end

    def score
        @health + points
    end

    def to_s
        "I'm #{@name} with a score of #{score}."
    end

    def <=>(other)
        other.score <=> score
    end

end