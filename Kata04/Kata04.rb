## PARTE 3: DRY FUSION

def calculateDiference(array)
  thingWithLessDiference = ""
  lessDiference = 100
  for i in array
    if i[1] < lessDiference
      lessDiference = i[1]
      thingWithLessDiference = i[0]
    end
  end
  thingWithLessDiference
end

## LEYENDO WEATHER.dat

columnNames = 0
tempDays = []

file = File.open("weather.dat", "r").readlines.each do |linea|
  if columnNames < 2
    columnNames += 1
  else
    numberDay = linea[2..3]
    maxTemp = linea[6..9].to_f
    minTemp = linea[12..15].to_f
    tempDays << [numberDay, maxTemp - minTemp]
  end
end

#dayWithLessDiference = ""
#lessDiference = 100

#for i in tempDays
#  if i[1] < lessDiference
#    lessDiference = i[1]
#    dayWithLessDiference = i[0]
#  end
#end

puts "El día con menor diferencia de temperatura es el día número #{calculateDiference(tempDays)}."

## LEYENDO FOOTBALL.dat

columnNames = 0
teams = []

file = File.open("football.dat", "r").readlines.each do |linea|
  if columnNames < 2
    columnNames += 1
  else
    teamName = linea[7..20]
    if teamName == "--------------"
      break
    else
      f = linea[43..44].to_i
      a = linea[50..51].to_i
      if f > a
        teams << [teamName, f - a]
      else
        teams << [teamName, a - f]
      end
    end
  end
end

#teamWithLessDiference = ""
#lessDiference = 100

#for i in teams
#  if i[1] < lessDiference
#    lessDiference = i[1]
#    teamWithLessDiference = i[0]
#  end
#end

puts "El equipo con menor diferencia de goles 'para' y 'en contra' es el equipo #{calculateDiference(teams)}."
