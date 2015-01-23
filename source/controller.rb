


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


module ModelInterface #put this in model.rb
extend self

  def to_deck_format(default_format)
    default_format.map! do |termdef|
        { definition: termdef[0], term: termdef[1] }
      end
  end
end

ModelInterface.to_deck_format(TXTParser.read)[-1]



module TaskController
include TXTParser
include ModelInterface


# here comes all the triggering of the commands deeper in the application.
end


