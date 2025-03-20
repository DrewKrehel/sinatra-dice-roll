require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  @luck_num = rand(100)
  
  erb(:elephant)
end

# get("/zebra") do
#   "We must add a route for each path we want to support"
# end

# get("/giraffe") do
#   "Hopefully this shows up without having to restart the server 🤞🏾"
# end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six, {:layout => :wrapper})
end

get("/dice/3/8") do
  first_die = rand(1..8)
  second_die = rand(1..8)
  third_die = rand(1..8)
  sum = first_die + second_die + third_die

  @outcome = "You rolled a #{first_die}, a #{second_die}, and a #{third_die} for a total of #{sum}."

  erb(:three_eight, {:layout => :wrapper})
end

get("/dice/5/4") do
  dice = Array.new(5) {rand(1..4)}
  sum = dice.sum

  @outcome = "You rolled #{dice.join(', ')} for a total of #{sum}."

  erb(:five_four, {:layout => :wrapper})
end

get("/dice/8/20") do
  dice = Array.new(8) {rand(1..20)}
  sum = dice.sum

  @outcome = "You rolled #{dice.join(', ')} for a total of #{sum}."

  erb(:eight_twenty, {:layout => :wrapper})
end
