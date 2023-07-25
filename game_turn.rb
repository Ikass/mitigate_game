require_relative 'die'
require_relative 'player'
require_relative 'gestures'

module GameTurn

    def self.take_turn(player)
        die_roll = Die.new.roll
    end

end