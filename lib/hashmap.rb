require_relative 'Linkedlist'
class Hashmap
  attr_accessor :load_factor, :capacity, :buckets, :keys
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
    key_index = hash(key) % capacity
    if buckets[key_index] == nil
      buckets[key_index] = Linkedlist.new
      buckets[key_index].prepend(value, key)
    elsif buckets[key_index] != nil
      buckets[key_index].append(value, nil, key)
    end
  end
end
test = Hashmap.new

test.set('apple', 'red')
test.set('apple', 'bed')
test.set('apple', 'cat')
test.set('apple', 'dad')


p test.buckets