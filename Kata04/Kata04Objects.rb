class DataFile

  def initialize(nameTextFile)
    @textFile = nameTextFile
    @columnNames = 0
    @array = []
  end

  def calculateDiference(begMainCl, endMainCL, begCl1, endCl1, begCl2, endCl2)
    File.open(@textFile, "r").readlines.each do |linea|
      if @columnNames < 2
        @columnNames += 1
      else
        number = linea[begMainCl..endMainCL]
        if number == "--------------"
          break
        else
          column1 = linea[begCl1..endCl1].to_f
          column2 = linea[begCl2..endCl2].to_f
          if column1 > column2
            @array << [number, column1 - column2]
          else
            @array << [number, column2 - column1]
          end
        end
      end
    end
    self.diference(@array)
  end

protected
  def diference(array)
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
end

archivo1 = DataFile.new("weather.dat")
archivo2 = DataFile.new("football.dat")
puts "La menor diferencia en el archivo1 weather.dat, la tiene el día #{archivo1.calculateDiference(2, 3, 6, 9, 12, 15)}."
puts "La menor diferencia en el archivo2 football.dat, la tiene #{archivo2.calculateDiference(7, 20, 43, 44, 50, 51)}"
