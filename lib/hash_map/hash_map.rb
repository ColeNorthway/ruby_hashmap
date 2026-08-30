# frozen_string_literal: true

# HashMap is a simple implementation of a classic hashing structure
#   - Only thing is it only takes strings as keys
#   - It is a practice project to understand hashmaps at a lower level
class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @buckets = Array.new(16) { Array.new }
  end

  def set(key, value)
    i = hash(key)

    if key?(key, i)
      j = key_index(key, i)
      @buckets[i][j][key] = value
    else
      @buckets[i].push({ key => value })
    end
  end

  def get(key)
    i = hash(key)
    j = key_index(key, i)
    return nil if j.nil?

    @buckets[i][j][key]
  end

  def length
    @buckets.reduce(0) { |acc, b| acc += b.length }
  end

  private

  def realloc

  end

  def key?(key, index)
    @buckets[index].any? { |pair| pair.keys.include?(key) }
  end

  def key_index(key, index)
    @buckets[index].index { |pair| pair.keys.include?(key) }
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
