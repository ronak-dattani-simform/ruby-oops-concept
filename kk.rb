class Vehicle
  def initialize(companyName, modelName)
    @companyName, @modelName = companyName, modelName
    puts "Your vehicle is #{@companyName}'s #{@modelName}."
  end

  def drive
    puts "Your #{@companyName} #{@modelName} is ready to drive."
  end

  def accelarate
  end

  # def check_avg
  #   # In Car class this method will never be called as Module analysis have this method.
  # end

  def break
  end
end

module Analysis
  attr_reader :price

  def self.check_avg(kms_run, fuel)
    average = kms_run / fuel
    puts "Average of your car is #{average} kmpl."
  end

  def self.price_calculator(price, years)
    current_price = price - price * (0.1) * years
    current_price = 0 if current_price < 0
    puts "Current price of your car is : #{current_price}"
  end
end

class Car < Vehicle #inheritance
  @@numberofwheels = 4
  @@maxspeed = 200
  attr_accessor :companyName
  attr_accessor :price
  attr_accessor :modelName
  attr_accessor :fuel_type

  def initialize(companyName, modelName)
    @companyName = companyName
    @modelName = modelName
    super(@companyName, @modelName)
    @speed = 0
  end

  def accelarate
    if (@speed < 200)
      @speed += 10
      puts "Current Speed : #{@speed}"
    else
      puts "Car at Maximum speed."
    end
  end

  def break
    if @speed == 0
      puts "Car is already stopped. Press A for accelerate."
      return
    end

    @speed -= 10 if @speed > 0
    puts "Current Speed : #{@speed}"
    puts "Car is stopped. Thanks for the ride. Hope you enjoyed it !" if @speed == 0
  end

  def door_open
    if @speed == 0
      puts "Door opened !"
    else
      puts "Please stop the car !"
    end
  end

  def action_drive
    self.drive

    puts "Press D to open the door."
    act = gets.chomp.downcase
    while act != "d"
      puts "Please open door first."
      act = gets.chomp.downcase
    end

    self.door_open
    puts "Press N if you want to quit."
    puts "Press A for Accelator"
    puts "Press B for Break"
    while act != "n"
      act = gets.chomp.downcase
      if act == "a"
        puts self.accelarate
      elsif act == "b"
        puts self.break
      elsif act == "n"
        puts "Thank you for drive."
      else
        puts "Choose the right action."
      end
    end
  end

  def action_check_avg
    puts "How much fuel car has consupted ? "
    fuel = gets.chomp.to_i
    puts "How many kilometers has car been driven ?"
    kms = gets.chomp.to_i
    Analysis.check_avg(kms, fuel)
    # check_avg(kms, fuel)
  end

  def action_price_calculator
    puts "What is price of car (you bought at) ?"
    price = gets.chomp.to_i
    puts "How many years has been of car ?"
    years = gets.chomp.to_i
    Analysis.price_calculator(price, years)
  end
end

puts "Welcome to Simform cars !"
puts "Please enter company name of your car "
company_name = gets.chomp.capitalize
puts "Please enter model name of your car : "
model = gets.chomp.capitalize
puts "----------------------------------------------------------"

car = Car.new(company_name, model)

ac = "" #ac means action
while ac != "4"
  puts "----------------------------------------------------------"
  puts "Please select action : 
          Press 1 to drive the car. 
          press 2 for check average of the car.
          press 3 to know selling price of the car.
          press 4 to exit."
  ac = gets.chomp

  case ac
  when "1"
    car.action_drive
  when "2"
    car.action_check_avg
  when "3"
    car.action_price_calculator
  when "4"
    exit
  else
    puts "Choose right action."
  end
end
