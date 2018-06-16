# HQ modul to Objective class
module Control
  def execute_instruction(instruction)
    rover = instruction[0].to_i
    rovers[rover].move(instruction[1..-1], terrain)
    rover_current_data_info(rover)
  end

  private

  def rover_current_data_info(param)
    rover = rovers[param]
    puts "#{rover.name} | X: #{rover.coordinate_x} | Y: #{rover.coordinate_y} | CD: #{rover.cardinal_direction}"
    puts ''
  end
end
