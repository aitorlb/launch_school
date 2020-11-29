# Notes on Special Topic of Interest for RB109:

## Popular collection methods (each, map, select, etc).

All of them take a block, and the code within the block is executed for each iteration, passing the current element as an argument to the block. The return value of the block is the return value of the last expression within the block.

#### each

Action: iteration.

Calls block once for each element in collection and ignores the return value of the block.

Returns the original collection.

Length of the returned collection is the length of the original collection.

```ruby
class Array
  def my_each
    i = 0

    while i < self.size
      yield(self[i])
    end

    self
  end
end

[1, 2].my_each { |e| puts e }
# 1
# 2
# => [1, 2]
```

#### select

Action: selection.

Calls block once for each element in collection and evaluates the truthiness of the return value of the block to perform selection.

Returns a new collection containing all elements of collection for which the given block returns a true value.

Length of the returned collection is the length of the original collection or less.

```ruby
class Array
  def my_select
    arr = []

    each do |e|
      arr << e if yield(e)
    end

    arr
  end
end

[1, 2].my_select { |e| e > 1 }
# => [2]
```

#### map

Action: transformation.

Calls block once for each element in collection and adds the return value to a new collection.

Returns a new collection containing the values returned by the block.

Length of the returned collection is the length of the original collection.

```ruby
class Array
  def my_map
    arr = []

    each do |e|
      arr << yield(e)
    end

    arr
  end
end

[1, 2].my_map { |e| e.to_s }
# => ["1", "2"]
```

References:
https://launchschool.com/lessons/85376b6d/assignments/39c98ed0

