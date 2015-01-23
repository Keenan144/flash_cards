
require_relative 'model.rb'
require_relative 'view.rb'

module TXTParser
extend self

  def read(file_source)
    superstring = File.read(file_source).split("\n")
    default_format = []
    superstring.each_slice(3) do |card|
      card.pop
      default_format << card
      end
    default_format
  end
end



module TaskController
include TXTParser
include ModelInterface
extend self
attr_accessor :card_deck, :times_attempted

 # here comes all the triggering of the commands deeper in the application.
 # just the triggering, its not the actual input "interface" where user inputs commands.
 # I made a new class for that down there, called ControlPanel, were going to make instance of that (so I made taskcontroller, which you named Controller before a module, instead of class.)

  def generate_deck(file_source)
  View.welcome
  default_format = TXTParser.read(file_source)
  deck_format = ModelInterface.to_deck_format(default_format)
  @card_deck = Deck.new(deck_format)
  end

  def startgame
    card_to_check = ModelInterface.to_default_format(@card_deck.pick_rand_card)
    @times_attempted = 1
    p card_to_check[0]
    check(gets.chomp, card_to_check )
  end

  def check(guess, card_to_check)
    times_attempted = 0
    if guess = "abort"
      View.end
    else card_to_check[1] == guess
      View.right
      startgame
    elsif @times_attempted < 3
      @times_attempted += 1
      View.try_again
      check(gets.chomp, card_to_check )
    else
      View.wrong(card_to_check[1])
      startgame
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




# DRIVER TESTS
puts "TESTING CONTROLLER"
puts
puts "TESTING card_to_default (Card)"
controller = ControlPanel.new
card1 = Card.new({term: "term1", definition: "definition1"})
card2 = Card.new({term: "term2", definition: "definition2"})
card3 = Card.new({term: "term3", definition: "definition3"})

p controller.card_to_default(card1) == ["definition1", "term1"]
p controller.card_to_default(card2) == ["definition2", "term2"]
p controller.card_to_default(card3) == ["definition3", "term3"]

puts "TESTING check(string, Card)"
p controller.check("term1", card1) == true
p controller.check("term3", card2) == false
p controller.check("term3", card3) == true



