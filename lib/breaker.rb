# frozen_string_literal: true

require_relative 'helper'

# Class that represents the player breaking the code
class CodeBreaker
  def initialize
    @past_guesses = []
  end

  def new_guess
    puts 'Time to take a guess!'
    MastermindHelper.manual_code
  end

  def display_past_guesses
    puts "\n\nPast guesses:\n"
    @past_guesses.each { |guess| MastermindHelper.show_code(guess) }
    puts "\n"
  end

  def add_guess_result(evaluated_guess)
    @past_guesses.push(evaluated_guess)
  end
end
