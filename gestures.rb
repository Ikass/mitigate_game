Gesture = Struct.new(:name)

module Gestures 
  GESTURES = [ 
    Gesture.new(:rock),
    Gesture.new(:paper),  
    Gesture.new(:scissors),
    Gesture.new(:lizard),
    Gesture.new(:spock)
  ]
  
  def self.random
    GESTURES.sample
  end
end