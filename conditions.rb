module Conditions

    attr_reader :win_conditions

    def win_conditions 
        {
            rock: [:scissors, :lizard],
            paper: [:rock, :spock],
            scissors: [:paper, :lizard],
            lizard: [:spock, :paper],
            spock: [:scissors, :rock]
        }
    end
    
end