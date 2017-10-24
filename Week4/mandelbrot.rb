include(Math)

def make2d(height, width)
  return Array.new(height){ Array.new(width,0) }
end



def color(div)
	if z > 50 then
		return [0, 0, 0]
	else
		return [0, 0, div/50.0 * 255]
	end	
end



def bright(x, y)
	z = Complex(0.0, 0.0)
	c = Complex(x, y)
	1000.times do
		z = z**2 + c
	end
	return color(z.abs)
end

def mandelbrot_image(s)
  image = make2d(s,s)
  for y in 0..(s-1)
    for x in 0..(s-1)
      image[y][x] = b(s,x,y)
    end
  end
  image
end
