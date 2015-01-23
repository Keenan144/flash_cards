require_relative "Model.rb"

module View
extend self
  # display the description
  def definition(definition)
    puts "What is the word for:
     #{definition}"
  end

  def wrong(correct_answer)
    puts "Mission failed, you tried 3 times!"
    puts "The correct answer was: #{correct_answer}"
  end

  def clear_screen!
    print "\e[2J"
    print "\e[H"
  end

  # when user enters the wrong term
  def try_again
    puts "Incorrect!"
  end

  # When the user enters the correct term
  def right
    puts "Correct!"
  end

  def loading
    10.times do print "."
    sleep(0.2)
    end
    clear_screen!
  end

  def welcome
    puts "Welcome! Get ready to play FlashCards"
    loading
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
