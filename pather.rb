require './pather_draw.rb'

input = ARGV.shift
output = ARGV.shift

pathway = Pather.new(input, output)
pathway.runner