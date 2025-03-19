dice = Array.new(4) { rand(1..4) }  # Rolls four 4-sided dice
sum = dice.sum  

outcome = "You rolled #{dice.join('----')} for a total of #{sum}."
puts outcome
