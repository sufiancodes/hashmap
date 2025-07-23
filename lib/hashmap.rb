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
m = test.values
p n
p m
test.entries