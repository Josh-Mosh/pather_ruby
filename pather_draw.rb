class Pather
	attr_accessor :input, :output

	@arr = []
	@hash_count = 0
	@position = []

	File.open(:input, 'r').each_line do |line|
		@arr = line.split(' ')
	end

	puts "Original Contents"
	puts @arr

	puts "\n\n"

	### Finds indexes of two hashes
	def find_positions
		@arr.each do |line|
			line.split('').each do |char|
				if char == "#"
					@hash_count += 1
					@position.push(@arr.index(line))
					@position.push(line.index(char))
				end
			end
		end
	end

	@h1 = Hash[*@position.flatten]

	# if @hash_count > 1
	# 	puts "there are #{@hash_count} '#' symbols present, drawing path"
	# else
	# 	puts "too few '#' symbols present, ending"
	# end

	def draw_path
		i=0
		while i < @h1.length-1 do
			start_r = @h1.keys[i]
			start_c = @h1.values[i]
			ending_r = @h1.keys[i+1]
			ending_c = @h1.values[i+1]
			draw_vertical_line(start_r, start_c, ending_r, ending_c)
			draw_horizontal_line(start_r, start_c, ending_r, ending_c)
			i += 1
		end
	end

	def draw_vertical_line(r1, c1, r2, c2)
		while r1 < r2
			@arr[r1+1][c1] = "*"
			r1 += 1
		end
	end

	def draw_horizontal_line(r1, c1, r2, c2)
		if c1 < c2
			while c1 < c2 do
				@arr[r2][c1] = "*"
				c1 += 1
			end
		else
			while c2 < c1 do
				@arr[r2][c2+1] = "*"
				c2 += 1
			end
		end
	end

	draw_path
	puts @arr

	# def make_new_file
	# 	File.open(output, 'w') do |f2|  
	# 	  f2.puts @arr
	# 	end
	# end

end

if __FILE__ == $0
  if ARGV.length != 2
    puts "Usage: ruby pather.rb <input file> <output file>"
  else
    pather = Pather.new(File.readlines(ARGV[0]))
    File.open(ARGV[1], 'w') {|f| f.write(pather.draw) }
  end
end
