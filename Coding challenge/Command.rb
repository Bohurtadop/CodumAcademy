require './Canvas.rb'

class Command
  @@canvasExists = false
  @@commands = []
  def initialize(key, parametersQuantity)
    @@commands << [key, parametersQuantity]
  end

  def validate(key, parametersQuantity, parameters)
    command = [key, parametersQuantity]
    if key == "Q"
      return false
    end
    for i in @@commands
      if i == command
        self.verify(command, parameters)
        return 0
      end
    end
    puts 'Wrong command.'
  end

protected
  def toCanvas(key, parameters)
    length = parameters.length()
    if length == 3
      @@Canvas.fill(parameters[0], parameters[1], parameters[2])
    else
      if key == 'L'
        @@Canvas.line(parameters[0], parameters[1], parameters[2], parameters[3])
      else
        @@Canvas.rectangle(parameters[0], parameters[1], parameters[2], parameters[3])
      end
    end
    @@Canvas.show()
  end

  def verify(command, parameters)
    if command[0] != "C"
      if !@@canvasExists
        puts 'You need to create canvas.'
      else
        self.toCanvas(command[0], parameters)
      end
    else
      @@Canvas = Canvas.new(parameters[0], parameters[1])
      @@Canvas.show()
      @@canvasExists = true
    end
  end
end
