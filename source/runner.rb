require_relative 'controller.rb'
# file_source = ARGV
controller = ControlPanel.new('text.txt')
# p controller

controller.execute("start game")

