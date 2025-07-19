require_relative 'node'
class Hashmap < Node
  attr_accessor :load_factor, :capacity, :buckets
  def initialize
    # load factor determines how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically number of the buckets
    @capacity = 16
    @buckets = Array.new(@capacity)
  end
  def hash(key)
    hash_code = 0
    key.each_char{|char| hash_code = 31*hash_code + char.ord}
    hash_code
  end
  def set(key, value)
    key_index = hash(key)%capacity
    buckets[key_index] = value
  end
  def get(key)
    key_index = hash(key)%capacity
    p key_index
    if key_index != nil
      return buckets[key_index]
    end
  end
end

test = Hashmap.new
p test.buckets
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
p test.buckets

p test.next_node