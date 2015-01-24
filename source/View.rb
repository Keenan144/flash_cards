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
  def get_input
    input = gets.chomp
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
