require 'digest'
class Hashmap
  def initialize
    # load factor determines how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically bucket
    @capacity = 0
  end
  def hash_code(key)
    # key = Digest::SHA256.hexdigest(key)
    hashcode = 0
    key.each_char{|char| hashcode = 31*hashcode + char.ord}
    hashcode
  end
end

l = Hashmap.new
puts l.hash_code("abc")