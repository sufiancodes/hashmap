require 'digest'
class Hashmap
  def initialize
    # load factor determines how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically bucket
    @capacity = 0
  end
  def hash(key)
    # key = Digest::SHA256.hexdigest(key)
    hash_code = 0
    key.each_char{|char| hash_code = 31*hash_code + char.ord}
    hash_code
  end
end

l = Hashmap.new
puts l.hash("abc")