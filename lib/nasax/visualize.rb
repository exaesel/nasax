# Class for visualize data on std output
class Visualize
  def initialize(obj)
    @objective = obj
  end

  def grid
    puts ''
    puts "You're grid is: x: 0..#{@objective.terrain.max_x}
     & y: 0..#{@objective.terrain.max_y}"
    table = Terminal::Table.new do |t|
      rows = []
      @objective.terrain.max_x.times { rows.push ' ' }
      (@objective.terrain.max_y - 1).times do
        t.add_row rows
        t << :separator
      end
      t.add_row rows
    end
    puts table
  end

  def rovers
    puts ''
    puts 'Rovers status'
    table = Terminal::Table.new(headings: %w[Index Name X Y CD]) do |t|
      rovers_index = @objective.rovers.count - 1
      @objective.rovers.each_with_index do |rover, index|
        rows = []
        rows.push index
        rows.push rover.name
        rows.push rover.coordinate_x
        rows.push rover.coordinate_y
        rows.push rover.cardinal_direction
        t.add_row rows
        t << :separator unless rovers_index == index
      end
    end
    puts table
  end
end
