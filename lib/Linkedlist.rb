# frozen_string_literal: true

require_relative "Node"
class Linkedlist
  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(value, key)
    @head = Node.new(value, @head, key)
  end

  def append(value, next_node, key)
    if @head.nil?
      @head = Node.new(value, next_node, key)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value, nil, key)
    end
  end
end
