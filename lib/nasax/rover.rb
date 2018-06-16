# Class definine Rover and him behave
class Rover
  attr_reader :name
  attr_accessor :coordinate_x, :coordinate_y, :cardinal_direction

  def initialize(params)
    input = params.split(' ')
    @name = SecureRandom.hex(2)
    @coordinate_x = input[0].to_i
    @coordinate_y = input[1].to_i
    @cardinal_direction = input[2]
  end

  def move(instruction, terrain)
    steps = instruction.split('')
    steps.each do |step|
      if %w[L R].include?(step)
        change_direction(step)
      else
        go_forward(terrain)
      end
    end
  end

  private

  def change_direction(direction)
    rotation = %w[S W N E]
    current_position = rotation.index(cardinal_direction)
    new_position = nil
    if direction == 'L'
      new_position = current_position - 1
      new_position = 3 if new_position == -1
    else
      new_position = current_position + 1
      new_position = 0 if new_position == 4
    end
    self.cardinal_direction = rotation[new_position]
  end

  def go_forward(terrain)
    case cardinal_direction
    when 'N'
      self.coordinate_y += 1
      if self.coordinate_y <= terrain.max_y
        self.coordinate_y
      else
        self.coordinate_y -= 1
      end
    when 'S'
      self.coordinate_y -= 1
      if self.coordinate_y >= 0
        self.coordinate_y
      else
        self.coordinate_y += 1
      end
    when 'W'
      self.coordinate_x -= 1
      if self.coordinate_x >= 0
        self.coordinate_x
      else
        self.coordinate_x += 1
      end
    when 'E'
      self.coordinate_x += 1
      if self.coordinate_x <= terrain.max_x
        self.coordinate_x
      else
        self.coordinate_x += 1
      end
    end
  end
end
