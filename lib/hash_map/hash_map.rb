# frozen_string_literal: true

class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.75
  end

  private

  attr_accessor :capacity
  attr_reader :load_factor
end
