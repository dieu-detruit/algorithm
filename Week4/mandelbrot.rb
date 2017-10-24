include(Math)

def make2d(height, width)
  return Array.new(height){ Array.new(width,0) }
end


BORDER = 10000.0

def color(div)
	return (div < BORDER/2.0) ? [1.0, 2.0 * div/BORDER, 2.0 * div/BORDER] : [2.0*(1-div/BORDER), 2.0*(1-div/BORDER),2.0*(1-div/BORDER)]
end



def bright(x, y)
	z = Complex(0.0, 0.0)
	c = Complex(x, y)
	100.times do
		z = z**2 + c
		if z.abs > BORDER then
			break
		end
	end
	return color(BORDER - z.abs)
end

def mandelbrot_image(s)
  image = make2d(s,s)
  for y in 0..(s-1)
    for x in 0..(s-1)
      image[y][x] = bright(4.0*x/s-3.0,4.0*y/s-2.0)
    end
  end
  image
end
