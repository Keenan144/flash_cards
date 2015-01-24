module ModelInterface #put this in model.rb
extend self

  def to_deck_format(default_format)
    default_format.map! do |termdef|
        { definition: termdef[0], term: termdef[1] }
      end
  end

end


class Deck
  attr_reader :cards
  def initialize(card_list)
    @cards = card_list
    # @cards = card_list.map! do |default_format_card|
    #   Card.new(default_format_card)
    # end
    # # @cards = []
    # # card_list.each do |card|
    # #   c Card.new(card)
    # # end
  end

  def pick_rand_card
    @cards.sample # works, but can by chance pick the same card
  end

  #input is array of hashes
  #for each hash we initiate a new card object
  #deck will be an array where we store all of the card objects

end

class Card
  attr_reader(:term, :definition)

  def initialize(args)
    @term = args[:term]
    @definition = args[:definition]
  end

  def self.factory(card_list)
      card_list.map! do |default_format_card|
      Card.new(default_format_card)
      end
  end
end

