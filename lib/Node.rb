# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node, :key

  def initialize(value, next_node, key)
    @key = key
    @value = value
    @next_node = next_node
  end
end
