# frozen_string_literal: true

COLORS = [1, 2, 3, 4, 5, 6].freeze

class Computer
  def initialize; end

  def make_guess
    secret_code = []
    0.upto(3) { secret_code << COLORS.sample }
    secret_code 
  end

  def generate_secret_code
    secret_code = []
    0.upto(3) { secret_code << COLORS.sample }
    secret_code
  end
end
