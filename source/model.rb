
class Deck

  def initialize card_list #array of hashes
    @cards = []
    card_list.each do |card|
      @cards << Card.new(card)
    end
  end

  def pick_rand_card
    @cards.sample(1)[0] # works, but can by chance pick the same card
  end

  #input is array of hashes
  #for each hash we initiate a new card object
  #deck will be an array where we store all of the card objects

end

class Card
  attr_reader :term, :definition

  def initialize args
    @term = args[:term]
    @definition = args[:definition]
  end
end

puts "TESTING CARD CREATION"
card1 = Card.new({term: "term", definition: "definition"})
card2 = Card.new({term: "term2", definition: "definition2"})
card3 = Card.new({term: "term3", definition: "definition3"})
card4 = Card.new({term: "term4", definition: "definition4"})

p card1.term == "term"
p card1.definition == "definition"
p card2.term == "term2"
p card2.definition == "definition2"
p card4.term == "term4"
p card4.definition == "definition4"

puts "TESTING DECK CREATION"
test_cases = [{term: "term", definition: "definition"},
              {term: "term2", definition: "definition2"},
              {term: "term3", definition: "definition3"}]

deck1 = Deck.new(test_cases)
rand_card1 = deck1.pick_rand_card
rand_card2 = deck1.pick_rand_card

p test_cases.include?({term: "#{rand_card1.term}", definition: "#{rand_card1.definition}"})
p test_cases.include?({term: "#{rand_card2.term}", definition: "#{rand_card2.definition}"})


