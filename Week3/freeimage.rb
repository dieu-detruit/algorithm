#-*- coding: utf-8 -*-
include(Math)

def make2d(height, width)
  Array.new(height){ Array.new(width,0) }
end

def brightness(s, x, y)
  if y==0
    [sin(x), sin(y), 0]
  else
    [sin(x), sin(y), x/y]
  end
end

def myimage(s)
  image = make2d(s,s)
  for y in 0..(s-1)
    for x in 0..(s-1)
      image[y][x] = brightness(s,x,y)
    end
  end
  image
end
