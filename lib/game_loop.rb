# frozen_string_literal: true

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
      puts "Welcome to MASTERMIND!!!\nEnter \"1\" to: Solve a random code.
      \nEnter \"2\" to: Solve a manually entered code.
      \n\nType \"QUIT\" at any time to end the game."
      choice = gets.chomp
    end
    create_maker(choice)
  end

  def create_maker(choice)
    case choice
    when 'QUIT'
      nil
    when '1'
      @maker = CodeMaker.new(true)
    when '2'
      @maker = CodeMaker.new(false)
    end
  end
end
