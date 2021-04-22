# frozen_string_literal: true

class SecretCode
  attr_accessor :code_combination

  def initialize(code_combination)
    @code_combination = code_combination
  end

end