require "./Command.rb"

def createCommands()
  @command = Command.new("C", 2)
  @command = Command.new("L", 4)
  @command = Command.new("R", 4)
  @command = Command.new("B", 3)
  @command = Command.new("Q", 0)
end

createCommands()
puts "Welcome to coding challenge.\n"
command = true
while command
  print "Enter command: "
  message = gets.chomp
  command = message.split(" ")
  key = command[0]
  parameters = []
  for i in (1..command.length()-1)
    parameters << command[i]
  end
  command = @command.validate(key, parameters.length, parameters)
end
