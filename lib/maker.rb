# frozen_string_literal: true

require_relative 'helper'

# Generates the code used in the game, as well as providing feedback
class CodeMaker
  attr_reader :code

  def initialize(random = false) # rubocop:disable Style/OptionalBooleanParameter
    @colors = %w[B O G P]
    if random == true
      @code = MastermindHelper.manual_code
    else
      @code = []
      @code.push(@colors.sample) while @code.length < 4
    end
  end

  def show_code
    MastermindHelper.show_code(@code)
  end
end
