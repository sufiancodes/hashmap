require_relative 'Linkedlist'
class Hashmap
  attr_accessor :load_factor, :capacity, :buckets, :keys, :values
  def initialize
    # load factor determines how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically number of the buckets
    @capacity = 16
    @buckets = Array.new(@capacity)
    @keys = []
    @values = []
  end
  def hash(key)
    hash_code = 0
    key.each_char{|char| hash_code = 31*hash_code + char.ord}
    hash_code
  end
  def set(key, value)
    resize_if_need
    key_index = hash(key) % capacity
    if buckets[key_index] == nil
      buckets[key_index] = Linkedlist.new
      buckets[key_index].prepend(value, key)
      keys << key
      values << value
    elsif buckets[key_index] != nil
      buckets[key_index].append(value, nil, key)
      keys << key
      values << value
    end
  end
  def get(key)
    key_index = hash(key)%capacity
    if key_index != nil
      return buckets[key_index]
    end
  end
  def has(key)
    key_index = hash(key)%capacity
    return false if buckets[key_index] == nil
    return true
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
    keys
  end
  def give_values
    values
  end
  
end
test = Hashmap.new

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
test.give_keys
test.give_values
# p test.buckets