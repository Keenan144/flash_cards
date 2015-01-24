
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

module CoreController
MAX_ATTEMPTS = 3
   def boot_up(file_source)
    View.clear_screen!
    View.welcome # --> View.display("Welcome you!")
    default_format = TXTParser.read(file_source)
    deck_format = ModelInterface.to_deck_format(default_format)
    list_of_cards = Card.factory(deck_format)
    @card_deck = Deck.new(list_of_cards)
  end


  def prepare_game
    card_to_check = @card_deck.pick_rand_card
    @times_attempted = 1
    View.definition(card_to_check.definition)
    check(View.get_input, card_to_check.term)
  end

  def attempts_exceeded?
    @times_attempted < MAX_ATTEMPTS
  end

  def end_game
    View.end
  end

  def match
      View.right
      View.loading
      startgame
  end

  def next_round(true_definition)
      View.wrong(true_definition)
      View.loading
      startgame
  end

  def try_again(true_definition)
      @times_attempted += 1
      View.try_again
      check(View.get_input, true_definition )
  end

end
