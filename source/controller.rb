require_relative 'model.rb'
require_relative 'view.rb'
require_relative 'deep_application.rb'


module TaskController
include CoreController
include TXTParser
include ModelInterface
extend self
attr_accessor :card_deck, :times_attempted

  def generate_deck(file_source)
    boot_up(file_source)
  end

  def startgame
    prepare_game
  end

  def check(guess, true_definition)
    times_attempted = 0
    if guess == "abort"
      end_game
    elsif true_definition == guess
      match
    elsif attempts_exceeded?
      try_again(true_definition)
    else
      next_round(true_definition)
    end
  end
end


class ControlPanel
include TaskController

  def initialize(file_source)
   generate_deck(file_source)
  end

  def execute(command)
    case command
      when "start game"
        startgame
    end
  end
end




