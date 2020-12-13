=begin
Transportation

Create a module named Transportation that contains three classes: Vehicle, 
Truck, and Car. Truck and Car should both inherit from Vehicle.
=end

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

vehicle = Transportation::Truck.new
truck   = Transportation::Truck.new
car     = Transportation::Car.new
