require_relative 'gestures'

class Die
    include Gestures

    attr_reader :gesture
  
  def initialize
    roll
  end
  
  def roll
    @gesture = Gesture.random
    @gesture
  end
end