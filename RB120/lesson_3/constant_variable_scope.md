# Constant Variable Scope

Constants have lexical scope, meaning the position of the code determines where it is available.
Ruby attempts to resolve a constant in the following order:
1. By searching lexically of the reference (ie, surrounding code)
2. By searching the inheritance of the enclosing class/module
3. By searching the main scope (ie, top level)

## Example 1

```ruby
module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4
```

When `Car#wheels` is called, a `WHEELS` constant is lexically searched in the surrounding code: the `wheels` method body, then the `Car` class definition. Since a `WHEELS` constant is not found in the lexical scope, it is then searched in the inheritance hierarchy of the enclosing class/module: `Car`. The ancestors of `Car` are: `FourWheeler`, `Vehicle`, `Object`, `Kernel`, and `BasicObject`. Since a `WHEELS` constant is found in the `FourWheeler` module, the consant `::FourWheeler::WHEELS` is referenced.

## Example 2

```ruby
module FourWheeler
  WHEELS = 4
end

class Vehicle
  WHEELS = 2

  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.maintenance   # => "Changing 2 tires."
```

When `Vehicle#maintenance` is called, a `WHEELS` constant is lexically searched in the surrounding code: the `maintenance` method body, then the `Vehicle` class definition. Since a `WHEELS` constant is found in the `Vehicle` class, the `::Vehicle::WHEELS` constant is referenced.

## Example 3

```ruby
WHEELS = 3

module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.maintenance   # => "Changing 3 tires."
```

When `Vehicle#maintenance` is called, a `WHEELS` constant is lexically searched in the surrounding code: the `maintenance` method body, then the `Vehicle` class definition. Since a `WHEELS` constant is not found in the lexical scope, it is then searched in the inheritance hierarchy of the enclosing class/module: `Vehicle`. The ancestors of `Vehicle` are: `Object`, `Kernel`, and `BasicObject`. Since a `WHEELS` constant is not found in either of them, it is then searched in the main scope. Since a `WHEELS` constant is not found in the main scope, the `::WHEELS` constant is referenced.

## Example 4

```ruby
module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.maintenance   # => NameError: uninitialized constant Maintenance::WHEELS
```

When `Vehicle#maintenance` is called, a `WHEELS` constant is lexically searched in the surrounding code: the `maintenance` method body, then the `Vehicle` class definition. Since a `WHEELS` constant is not found in the lexical scope, it is then searched in the inheritance hierarchy of the enclosing class/module: `Vehicle`. The ancestors of `Vehicle` are: `Object`, `Kernel`, and `BasicObject`. Since a `WHEELS` constant is not found in either of them, it is then searched in the main scope. Since a `WHEELS` constant is not found in the main scope, a `NameError` is raised.

## Example 5

```ruby
module FourWheeler
  WHEELS = 4
end

class Vehicle
  WHEELS = 2

  def maintenance
    "Changing #{wheels} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.maintenance   # => "Changing 4 tires."
```

When `Car#wheels` is called inside `Vehicle#maintenance`, the consant `WHEELS` is revolved in the same way as in the [Example 1](#example-1). This is because the lexical scope of `Car#wheels` does not include the `Vehicle` class.
