# frozen_string_literal: true

require_relative 'breaker'
require_relative 'maker'

# Run the main game!
class GameLoop
  def initialize
    @breaker = CodeBreaker.new
    settings
  end

  def settings
    options = %w[1 2 QUIT]
    choice = 'Not a choice!'
    until options.include?(choice)
      puts "\nEnter \"1\" to: Solve a random code.
      \nEnter \"2\" to: Solve a manually entered code.
      \n\nType \"QUIT\" at any time to end the game."
      choice = gets.chomp
    end
    return if choice == 'QUIT'

    create_maker(choice)
    main_game_loop
  end

  def create_maker(choice)
    case choice
    when '1'
      @maker = CodeMaker.new(true)
    when '2'
      @maker = CodeMaker.new(false)
    end
  end

  def main_game_loop
    win = false
    until win
      choice = game_options
      case choice
      when '1'
        @breaker.display_past_guesses
      when 'QUIT'
        return
      else
        evaluation = @maker.evaluate(choice)
        win = true if evaluation == 'WIN'
        output = "#{choice} - #{evaluation}"
        @breaker.add_guess_result(output)
        MastermindHelper.show_code(output)
      end
    end
    if win
      win_game
    else
      lose_game
    end
  end

  def game_options
    puts "Type your next guess!\nOr"
    puts '"1": Display past guesses.'
    puts '"QUIT": End the game.'
    gets.chomp
  end

  def lose_game
    puts 'Better luck next time! The answer was:'
    @maker.show_code
  end

  def win_game
    puts 'Congratulations! You found the code!!!'
  end
end
