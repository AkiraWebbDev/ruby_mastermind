# frozen_string_literal: true

require 'colorize'

# Provides some useful functionality to the rest of the program
class MastermindHelper
  def self.show_code(code)
    puts 'The master code is:'
    print_code = []
    code.each do |element|
      print_code.push(colored_code(element))
    end
    puts print_code.join(' ')
  end

  def self.colored_code(element)
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

  def self.get_manual_code
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

  def self.check_valid(code)
    colors = %w[B O G P]
    code.each do |color|
      valid = colors.include?(color)
      return false unless valid
    end
    true
  end
end
