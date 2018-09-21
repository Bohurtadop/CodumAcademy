class Canvas
  def initialize(width, height)
    width = width.to_i + 2
    height = height.to_i + 2
    edge = []
    for i in (0..width-1)
      edge.push("-")
    end
    @canvas = []
    @canvas.push(edge)
    for i in (1..height-2)
      @canvas[i] = []
      @canvas[i] << "|"
      for j in (1..width-2)
        @canvas[i] << " "
      end
      @canvas[i] << "|"
    end
    @canvas.push(edge)
  end

  def line(x1, y1, x2, y2)
    x1 = x1.to_i
    x2 = x2.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    if x1 != x2 && y1 != y2
      puts "Expected horizontal or vertical line."
    elsif x1 == x2 && y1 == y2
      @canvas[y1][x1] = 'x'
    elsif x1 == x2
      if y1 > y2
        minor = y2
        major = y1
      else
        minor = y1
        major = y2
      end
      for i in (minor..major)
        @canvas[i][x1] = 'x'
      end
    elsif y1 == y2
      if x1 > x2
        minor = x2
        major = x1
      else
        minor = x1
        major = x2
      end
      for i in (minor..major)
        @canvas[y1][i] = 'x'
      end
    end
  end

  def rectangle(x1, y1, x2, y2)
    self.line(x1, y1, x2, y1)
    self.line(x2, y1, x2, y2)
    self.line(x1, y1, x1, y2)
    self.line(x1, y2, x2, y2)
  end

  def fill(x, y, color)
    x = x.to_i
    y = y.to_i
    if @canvas[y][x] == ' '
      @canvas[y][x] = color.to_s
      self.fill(x-1, y, color)
      self.fill(x, y-1, color)
      self.fill(x+1, y, color)
      self.fill(x, y+1, color)
    end
  end

  def show()
    for i in @canvas
      for j in i
        print j.to_s
      end
      puts "\n"
    end
  end
end
