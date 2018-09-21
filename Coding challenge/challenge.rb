require "./Canvas.rb"

puts "Welcome to coding challenge.\n"
validation = false
while true
  print "Enter command: "
  message = gets.chomp
  command = message.split(" ")
  if command[0] == "C"
    canvas = Canvas.new(command[1], command[2])
    canvas.show()
    validation = true
  elsif command[0] == "L"
    if validation == true
      canvas.line(command[1], command[2], command[3], command[4])
      canvas.show()
    else
      puts "You need to create Canvas."
    end
  elsif command[0] == "R"
    if validation == true
      canvas.rectangle(command[1], command[2], command[3], command[4])
      canvas.show()
    else
      puts "You need to create Canvas."
    end
  elsif command[0] == "B"
    if validation == true
      canvas.fill(command[1], command[2], command[3])
      canvas.show()
    else
      puts "You need to create Canvas."
    end
  elsif command[0] == "Q"
    print "Exit successfully."
    break
  else
    puts "Wrong command."
  end
end
