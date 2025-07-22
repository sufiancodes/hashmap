require_relative 'node'
class Hashmap < Node
  attr_accessor :load_factor, :capacity, :buckets, :keys
  def initialize
    # load factor determines how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically number of the buckets
    @capacity = 16
    @buckets = Array.new(@capacity)
    @keys = []
  end
  def hash(key)
    hash_code = 0
    key.each_char{|char| hash_code = 31*hash_code + char.ord}
    hash_code
  end
  def set(key, value)
    resize_if_need
    keys << key
    # keys.push(key)
    key_index = hash(key)%capacity
    if buckets[key_index] != nil 
      old = buckets[key_index]
      buckets[key_index] = Node.new
      buckets[key_index].key = key_index
      buckets[key_index].value = value
      buckets[key_index].next_node = old
    else
      buckets[key_index] = value
    end
  end
  def calculate_bucket_size
    total_filled = 0
    @buckets.each do |bucket|
      total_filled += 1 if bucket != nil
    end
    total_filled
  end
  def calculate_total_entries
    total_entry = load_factor * capacity
    total_entry.to_i
  end
  def resize_if_need
    total_filled = calculate_bucket_size
    total_entries = calculate_total_entries
    if total_filled >= total_entries
      @capacity = capacity * 2
    end
  end
  def get(key)
    key_index = hash(key)%capacity
    p key_index
    if key_index != nil
      return buckets[key_index]
    end
  end
  def has(key)
    key_index = hash(key)%capacity
    if buckets[key_index] == nil
      return false
    else
      return true
    end
  end
  def remove(key)
    key_index = hash(key)%capacity
    return nil if buckets[key_index] == nil
    deleted_item = buckets[key_index]
    buckets[key_index] = nil
    return deleted_item
  end
  def length
    length = calculate_bucket_size
    return length
  end
  def clear
    buckets.each_with_index do |value, index|
      buckets[index] = nil
    end
  end
  def give_keys
    return keys
  end
  def values
    array = []
    buckets.each do |value|
      if value != nil
        array << value
      end
    end
    return array
  end
end

test = Hashmap.new
# p test.buckets
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('grape', 'Crimson')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('ls', 'goldenay')
# p test.buckets
# p test.keys
# p test.clear
# p test.buckets
# p test.buckets
# total = test.calculate_bucket_size
# n = test.resize
# p total
# p test.get("hat")
# n = test.has("alizan")
# p n
# m = test.remove("lion")
# p m
# length = test.length
# p length
n = test.give_keys
p n