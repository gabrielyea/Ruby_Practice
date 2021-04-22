# frozen_string_literal: true

# represents a peg, stores peg info
class Peg
  attr_accessor :symbol, :selected, :memory

  def initialize(symbol)
    @symbol = symbol
    @selected = false
    @memory = []
  end
end

