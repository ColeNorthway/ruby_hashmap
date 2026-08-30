# frozen_string_literal: true

class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @buckets = Array.new(16) { Array.new }
  end

  def set(key, value)
    i = hash(key)

    if key?(key)
      j = key_index(key)
      @buckets[i][j][key] = value
    else
      @buckets[i].push({ key => value })
    end

    # Handle realloc here
  end

  private

  def key?(key)
    @buckets.any? { |pair| pair.keys.include?(key) }
  end

  def key_index(key)
    @buckets.index { |pair| pair.keys.include?(key) }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % capacity
  end

  attr_accessor :capacity, :buckets
  attr_reader :load_factor
end
