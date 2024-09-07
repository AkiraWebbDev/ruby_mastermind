# frozen_string_literal: true

require_relative 'helper'

# Class that represents the player breaking the code
class CodeBreaker
  attr_accessor :past_guesses

  def initialize
    @past_guesses = []
  end

  def new_guess
    puts 'Time to take a guess!'
    MastermindHelper.manual_code
  end

  def display_past_guesses
    @past_guesses.each { |guess| MastermindHelper.show_code(guess) }
  end
end
