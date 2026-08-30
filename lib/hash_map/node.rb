# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(val = nil, next_n = nil)
    @value = val
    @next_node = next_n
  end
end
