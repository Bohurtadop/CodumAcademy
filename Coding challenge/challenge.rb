require "./Canvas.rb"

puts "Welcome to coding challenge.\n"
while true
  print "Enter command: "
  message = gets.chomp
  command = message.split(" ")
  if command[0] == "C"
    canvas = Canvas.new(command[1], command[2])
  elsif command[0] == "L"
    canvas.line(command[1], command[2], command[3], command[4])
  elsif command[0] == "R"
    canvas.rectangle(command[1], command[2], command[3], command[4])
  elsif command[0] == "B"
    canvas.fill(command[1], command[2], command[3])
  elsif command[0] == "Q"
    break
    print "Exit successfully"
  end
  canvas.show();
end
