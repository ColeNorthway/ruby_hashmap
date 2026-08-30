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

    realloc
  end

  def get(key)
    i = hash(key)
    j = key_index(key, i)
    return nil if j.nil?

    @buckets[i][j][key]
  end

  def length
    @buckets.reduce(0) { |acc, b| acc + b.length }
  end

  private

  def realloc?
    threshold = (@capacity * @load_factor).to_i
    length > threshold
  end

  def get_pairs
    @buckets.reduce([]) { |acc, b| acc + b }
  end

  def set_pairs(pairs)
    pairs.each do |p|
      i = hash(p.keys[0])
      @buckets[i].push(p)
    end
  end

  def realloc
    return unless realloc?

    pairs = get_pairs
    @capacity *= 2
    @buckets = Array.new(@capacity) { [] }

    set_pairs(pairs)
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
