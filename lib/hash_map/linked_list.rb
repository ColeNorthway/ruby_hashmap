# frozen_string_literal: true

require_relative 'node'


# Linked List represents many nodes that are connected to each other
#   - Each node contains some sort of data
#   - This is a replication of a low level programming concept
#   - In low level programming this is useful because we can dynamically insert and remove elements
#   - This allows for more flexibility than a contigously allocated array
class LinkedList
  attr_reader :head, :tail

  def initialize(values = [])
    @head = nil
    @tail = nil

    prev_node = nil
    values.length.times do |i|
      n = Node.new(values[i])

      if i.zero?
        @head = n
        prev_node = @head
      end

      if i == values.length - 1
        @tail = n
        prev_node.next_node = @tail
      else
        prev_node.next_node = n
        prev_node = prev_node.next_node
      end

      @head.next_node = nil if @head == @tail && !head.nil?
    end
  end

  def append(v)
    n = Node.new(v)
    if @head.nil?
      @head = n
    else
      @tail.next_node = n
    end
    @tail = n
  end

  def prepend(v)
    n = Node.new(v)
    if @head.nil?
      @tail = n
    else
      n.next_node = @head
    end
    @head = n
  end

  def size
    node = @head
    count = 0
    while node
      count += 1
      node = node.next_node
    end

    count
  end

  def at(index)
    return nil if index.negative?

    node = @head
    count = 0
    while node
      return node.value if count == index

      node = node.next_node
      count += 1
    end

    nil
  end

  def pop
    return nil if @head.nil?

    ret = @head
    @head = ret.next_node
    ret.value
  end

  def contains?(value)
    return false if @head.nil?

    node = @head
    while node
      return true if node.value == value
      node = node.next_node
    end

    false
  end

  def index(value)
    return nil if @head.nil?

    node = @head
    count = 0
    while node
      return count if node.value == value
      count += 1
      node = node.next_node
    end
  end

  def to_s
    return 'nil' if @head.nil?

    node = @head
    res = ''
    while node
      res += "( #{node.value} ) -> "
      node = node.next_node
    end

    res += 'nil'
    res
  end
end














