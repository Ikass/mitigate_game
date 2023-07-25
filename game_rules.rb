Rule = Struct.new(:name, :conditions)

module GameRules

   RULES = [
        Rule.new.(:rock , [:scissors, :lizard]),
        Rule.new.(:paper , [:rock, :spock]),  
        Rule.new.(:scissors , [:paper, :lizard]),
        Rule.new.(:lizard , [:spock, :paper]),
        Rule.new.(:spock , [:scissors, :rock])
    ]
    
end