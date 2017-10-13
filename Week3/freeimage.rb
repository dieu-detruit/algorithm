# -*- coding: utf-8 -*-
include(Math)

def make2d(height, width)
  Array.new(height){ Array.new(width,0) }
end

def brightness(s, x, y)
	(x+y)/(x**2+y**2)
end

def distance(x, y, p, q)
  # 点(x,y)と点(p,q)の間の距離
  sqrt( (x-p)**2 + (y-q)**2 )
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
