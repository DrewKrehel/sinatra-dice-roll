require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/howdy") do
  return "Hello, world!"
end

get("/") do
  luck_num = rand(100)
  return "Luck # = #{luck_num}"

  "
  <h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a herf=\"/dice/3/8\">Roll three 8-sided dice</a></li>
    
  </ul>
  "
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/3/8") do
  first_die = rand(1..8)
  second_die = rand(1..8)
  third_die = rand(1..8)
  sme = first_die + second_die + third_die

  outcome = "You rolled a #{first_die}, a #{second_die}, and a #{third_die} for a total of #{sum}."

  "<h1>3d8</h1>
  <p>#{outcome}</p>"
end
