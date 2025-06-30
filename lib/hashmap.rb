class Hashmap
  def initialize
    # load factor detrmined how filled buckets can get before resizing means get resize after 75% filled
    @load_factor = 0.75
    # the capacity of hashmap is basically bucket
    @capacity = 0
  end
end
