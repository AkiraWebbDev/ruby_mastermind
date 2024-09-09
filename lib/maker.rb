# frozen_string_literal: true

require_relative 'helper'

# Generates the code used in the game, as well as providing feedback
class CodeMaker
  attr_reader :code

  def initialize(random = false) # rubocop:disable Style/OptionalBooleanParameter
    @colors = %w[B O G P R]
    if random
      @code = []
      @code.push(@colors.sample) while @code.length < 4
    else
      @code = MastermindHelper.manual_code
    end
  end

  def show_code
    MastermindHelper.show_code(@code)
  end

  # Evaluates the guess, returning a string that shows the evaluation of the guess
  def evaluate(guess)
    w_pegs = 0
    r_pegs = 0
    guess = guess.split
    code_clone = @code.clone
    guess.each_with_index do |color, index|
      next unless code_clone.include?(color)

      code_clone.delete_at(code_clone.index(color))
      w_pegs += 1
      if @code[index] == color
        r_pegs += 1
        w_pegs -= 1
      end
    end
    return 'WIN' if r_pegs == 4

    "#{w_pegs} W : #{r_pegs} R"
  end
end
