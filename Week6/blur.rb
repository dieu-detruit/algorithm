include(Math)

require './utlogo.rb'

di = [0, 1, -1, 0, 1, -1, 0, 1, -1]
dj = [0, 1, -1, 1, -1, 0, -1, 0, 1]

def blur(image)
	height = image.length
	width = image[0].length
	
	# weight = [-4.0, 1.0, 1.0, 0, 1.0, 0, 0, 0, 1.0]
	avr= 1.0/9.0
	weight = [avr, avr, avr, avr, avr, avr, avr, avr, avr] 

	1.upto(height-2) do |i|
		1.upto(width-2) do |j|
			sum = 0.0
			next if image[i][j] == 1
			9.times do |k|
				sum += weight[k] * image[i + di[k]][j + dj[k]]
			end
			image[i][j] = sum
		end
	end
end

show(logo)
show(blur(logo))
show(blur(blur(logo)))
