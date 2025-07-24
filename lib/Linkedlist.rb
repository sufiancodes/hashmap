# frozen_string_literal: true

require_relative 'Node'
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

  def size
    size = 1
    current = head
    until current.next_node.nil?
      size += 1
      current = current.next_node
    end
    size
  end

  def give_head
    p @head
  end

  def give_tail
    current = @head
    current = current.next_node until current.next_node.nil?
    p current
  end

  def at(index)
    current = @head
    index.times { current = current.next_node }
    p "Node at index #{index}:value = #{current.value}, next node = #{current.next_node ? current.next_node.value : 'nil'}"
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      node = @head
      @head = nil
      node
    end
    current = @head
    current = current.next_node until current.next_node.next_node.nil?
    poped = current.next_node
    current.next_node = nil
    poped
  end

  def contains?(value)
    current = @head
    loop do
      return false if current.nil?
      return  true if current.value == value

      current = current.next_node
    end
  end

  def find(value)
    current = @head
    index = 0
    until current.value.nil?
      return index if current.value == value

      current = current.next_node
      return nil if current.nil?

      index += 1
    end
  end

  def to_s
    current = @head
    result = ''
    size.times do
      result += "(#{current.value})->"
      current = current.next_node
    end
    result += '(nil)'
  end

  def insert_at(value, index)
    node = Node.new(value, nil)
    if index.zero?
      node.next_node = @head
      @head = node
      return node
    end
    current_index = 0
    current = @head
    while !current.nil? && current_index < index - 1
      current = current.next_node
      current_index += 1
    end
    return nil if current.nil?

    node.next_node = current.next_node
    current.next_node = node
    node
  end

  def remove_at(index)
    return if @head.nil?

    if index.zero?
      @head = @head.next_node
      return
    end
    current = @head
    current_index = 0
    while current && current_index < index - 1
      current = current.next_node
      current_index += 1
    end
    return if current.nil? || current.next_node.nil?
    current.next_node = current.next_node.next_node
  end
end

# ll = Linkedlist.new
# p ll
# ll.append("helo", nil, "14")
# p ll
# ll.prepend("goat","14")
# ll.prepend("Sheep",14)
# p ll