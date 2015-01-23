

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


module FormatController
extend self

  def to_deck_format(default_format)
    default_format.map! do |termdef|
        { definition: termdef[0], term: termdef[1] }
      end
  end
end

FormatController.to_deckformat(TXTParser.read)[-1]





__END__

text = TXTParser.read
#p text.count("\n")
puts
puts

splitted = text.split("\n")
total_list = []
sliced = splitted.each_slice(3) do |thing|
thing.pop
total_list << thing
end

puts " ><><><><><><><><><><><><><><><><><><><><>"

total_list.map! do |termdef|
  { definition: termdef[0], term: termdef[1] }
end

p total_list

# # p test1
# # puts
# deck in deck format
# [ {definition: text, term: text}  ......  ]


# deck in deck
# [ obj obj obj obj ]

# card in default format
# ["To create a second name for the variable or method.", "alias"]

# [ ["To create a second name for the variable or method.", "alias"] ["To create a second name for the variable or method.", "alias"] card ]


# select  card prodecure
# model is asked for card
# model returns card bject <object> to converter

# converter:
#  <object> --> ["To create a second name for the variable or method.", "alias"]


# terminal converting

# takes default format
# string = array[0]

# View.print(string)


# empty = []
# 2.times do
# empty << test1.shift(2)
# test1.shift
# end

# p empty


# empty = []
# 2.times do
#   empty << test1.shift
#   test1.shift
# end
# p empty
# puts
# p test1

# module Formatcontroller
#  extend self

#     def
#     end


# end




__END__
"definition\n"
"term
\n"
"\\n"
......
-->
\  -->  [ {:defition: definition, :term, term} ]


