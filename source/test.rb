

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



puts "TESTING THE VIEW"
view = View.new
p view.right == "Correct!"
p view.wrong == "Incorrect!"
p view.welcome == "Welcome! Get ready to play FlashCards"
p view.end == "Exiting FlashCards. Thanks for playing!"
card1 = Card.new({term: "term", definition: "Da definition"})
p view.definition(card1) == "What is the word for \"Da definition\" ?"

