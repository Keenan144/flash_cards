require_relative "Model.rb"

class View

  # display the description
  def definition (card)
    p "What is the word for \"#{card.definition}\" ?"
  end

  # when user enters the wrong term
  def wrong
    p "Incorrect!"
  end

  # When the user enters the correct term
  def right
    p "Correct!"
  end

  def welcome
    p "Welcome! Get ready to play FlashCards"
  end

  def end
    p "Exiting FlashCards. Thanks for playing!"
  end
end

puts "TESTING THE VIEW"
view = View.new
p view.right == "Correct!"
p view.wrong == "Incorrect!"
p view.welcome == "Welcome! Get ready to play FlashCards"
p view.end == "Exiting FlashCards. Thanks for playing!"
card1 = Card.new({term: "term", definition: "Da definition"})
p view.definition(card1) == "What is the word for \"Da definition\" ?"
