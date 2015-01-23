require_relative "Model.rb"

module View
extend self
  # display the description
  def definition (card)
    puts "What is the word for \"#{card.definition}\" ?"
  end

  def wrong(correct_answer)
    puts "mission failed, because you tried 3 times! The correct answer was: #{correct_answer}"
  end


  # when user enters the wrong term
  def try_again
    puts "Incorrect!"
  end

  # When the user enters the correct term
  def right
    puts "Correct!"
  end

  def welcome
    puts "Welcome! Get ready to play FlashCards"
  end

  def end
    puts "Exiting FlashCards. Thanks for playing!"
  end
end

# puts "TESTING THE VIEW"
# view = View.new
# p view.right == "Correct!"
# p view.wrong == "Incorrect!"
# p view.welcome == "Welcome! Get ready to play FlashCards"
# p view.end == "Exiting FlashCards. Thanks for playing!"
# card1 = Card.new({term: "term", definition: "Da definition"})
# p view.definition(card1) == "What is the word for \"Da definition\" ?"
