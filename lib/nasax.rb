require 'nasax/control.rb'
require 'nasax/objective.rb'
require 'nasax/rover.rb'
require 'nasax/terrain.rb'
require 'nasax/visualize.rb'
require 'terminal-table'
require 'securerandom'

puts 'Hello in nasax! This app allo you to control rovers on grid'
puts ''
puts 'Type size of grid in format: 4x4, 5x7, 2x7'
while input = gets
  if /\d+x\d+/ =~ input
    obj_params = input.chomp.strip.split('x')
    terrain = Terrain.new(obj_params[0].to_i, obj_params[1].to_i)
    @objective = Objective.new(terrain)
    break
  else
    puts 'Invalid input'
  end
end

Visualize.new(@objective).grid
Visualize.new(@objective).rovers

amount_of_rovers = @objective.rovers.count
puts ''
puts "It's time to control rovers! There are #{amount_of_rovers}. You can chose which one would you like to control by chosing index of particular"
puts 'Orders: L (left 90deg), R (right 90deg), M (move forward one grid)'
puts "Example: '2LMM'"
puts ''
puts 'Other commands: 1) STATUS, 2) ET (End of Transmission) to exit.'
puts ''

while raw_input = gets
  input = raw_input.chomp
  if /[0-#{amount_of_rovers}{1}][LRM]/ =~ input
    @objective.execute_instruction(input)
  elsif /[S][T][A][T][U][S]/ =~ input
    Visualize.new(@objective).rovers
  elsif /[E][T]/ =~ input
    exit 1
  else
    puts 'Invalid input'
  end
end
