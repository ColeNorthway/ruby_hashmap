# frozen_string_literal: true

class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @buckets = Array.new(16) { Array.new }
  end

  private

  attr_accessor :capacity, :buckets
  attr_reader :load_factor
end
