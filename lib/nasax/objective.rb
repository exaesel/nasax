# Class definine the grid to examine and random quantity of rovers
class Objective
  include Control
  attr_accessor :terrain, :rovers

  def initialize(terrain)
    @terrain = terrain
    @rovers = rovers_successfully_landed
  end

  private

  def rovers_successfully_landed
    rovers = []
    @matrix_fields = [(0..@terrain.max_x).to_a, (0..@terrain.max_y).to_a]
    (2..9).to_a.sample.times do
      rovers.push(landing_rover_on_field)
    end
    rovers
  end

  def landing_rover_on_field
    rover = []
    rover.push random_coo(0)
    rover.push random_coo(1)
    rover.push random_landing_direction
    Rover.new rover.join ' '
  end

  def random_coo(x_or_y)
    random_cooridinate = @matrix_fields[x_or_y].sample
    remove_occupied_field(x_or_y, random_cooridinate)
    random_cooridinate
  end

  def remove_occupied_field(x_or_y, coordinate)
    @matrix_fields[x_or_y] -= [coordinate]
  end

  def random_landing_direction
    %w[N S W W].sample
  end
end
