
#give the user a definition
#input will be a string from the user (guess for the term)
#if input == term that is associted with that definition

# rand_card
# give it to user
# get term
# check the original rand_card and the user's term

# default card format
#["this is the definition", "term"]

# default deck format
#[["definitions ...", "term1"], ["definitions2... ", "term2"] ....
require_relative "model.rb"

class Controller

  # input: card
  # single array: ["definition", "term"]
  def card_to_default (card)
    ["#{card.definition}", "#{card.term}"]
  end

 # def default_to_card () #array: [def, term]

  def check(guess, card)
    card.term == guess
  end
end

# DRIVER TESTS
puts "TESTING CONTROLLER"
puts
puts "TESTING card_to_default (Card)"
controller = Controller.new
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
