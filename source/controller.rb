require_relative 'model.rb'

module TXTParser
extend self

  def read(file_source='text.txt')
    superstring = File.read(file_source).split("\n")
    default_format = []
    superstring.each_slice(3) do |card|
      card.pop
      default_format << card
      end
    default_format
  end
end

default_format = TXTParser.read






module TaskController
include TXTParser
include ModelInterface

 # here comes all the triggering of the commands deeper in the application.
 # just the triggering, its not the actual input "interface" where user inputs commands.
 # I made a new class for that down there, called ControlPanel, were going to make instance of that (so I made taskcontroller, which you named Controller before a module, instead of class.)

  def card_to_default(card)
    ["#{card.definition}", "#{card.term}"]
  end
 # def default_to_card () #array: [def, term]
  def check(guess, card)
    card.term == guess
  end

end


class ControlPanel
include TaskController

# all user input will be done here. Probably going to make a case switch over here or something.


end


puts
ModelInterface.to_deck_format(TXTParser.read)[-1]
puts "above this ine"


## Drivercode isnt working anymore because of line 63: instance of something that is now a module. We have to rewrite
# it just a little bit so that it now uses ControlPanel, which replaces the old Controller class.



# DRIVER TESTS
puts "TESTING CONTROLLER"
puts
# puts "TESTING card_to_default (Card)"
# controller = TaskController.new
# card1 = Card.new({term: "term1", definition: "definition1"})
# card2 = Card.new({term: "term2", definition: "definition2"})
# card3 = Card.new({term: "term3", definition: "definition3"})

# p controller.card_to_default(card1) == ["definition1", "term1"]
# p controller.card_to_default(card2) == ["definition2", "term2"]
# p controller.card_to_default(card3) == ["definition3", "term3"]

# puts "TESTING check(string, Card)"
# p controller.check("term1", card1) == true
# p controller.check("term3", card2) == false
# p controller.check("term3", card3) == true


