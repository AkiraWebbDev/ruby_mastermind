# frozen_string_literal: true

require 'colorize'

# Generates the code used in the game, as well as providing feedback
class CodeMaker
  def initialize(random = false) # rubocop:disable Style/OptionalBooleanParameter
    @colors = %w[B O G P]
    if random == true
      @code = manual_code
    else
      @code = []
      @code.push(colors.sample) while @code.length < 4
    end
  end

  def show_code
    puts 'The master code is:'
    print_code = []
    @code.each do |element|
      print_code.push(colored_code(element))
    end
    puts print_code.join(' ')
  end

  def colored_code(element)
    case element
    when 'B'
      'B '.colorize(:cyan)
    when 'O'
      'O '.colorize(:yellow)
    when 'G'
      'G '.colorize(:green)
    when 'P'
      'P '.colorize(:magenta)
    end
  end

  # Optional way for players to play the game!
  def manual_code
    code = []
    is_valid_code = false
    until code.length == 4 && is_valid_code
      puts 'Enter a sequence of 4 colors (e.g. B O G P).'
      code = gets.chomp.split
      is_valid_code = check_valid(code)
      puts '^ INVALID CODE DETECTED, ONLY USE B, O, G or P ^'.colorize(:red) unless is_valid_code
      puts '^ WRONG LENGTH, TRY AGAIN ^'.colorize(:red) unless code.length == 4
      puts '---------------------------------------------------------'
    end
    code
  end

  def check_valid(code)
    code.each do |color|
      valid = @colors.include?(color)
      return false unless valid
    end

    true
  end
end

code_maker = CodeMaker.new(true)

code_maker.show_code
