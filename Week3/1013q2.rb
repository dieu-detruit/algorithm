# -*- coding: utf-8 -*-
include(Math)

def make2d(height, width)
  Array.new(height){ Array.new(width,0) }
end

def b(s, x, y)
  r = s / 2 
  d = distance(x, y, r, r)
  # if を使ってbを計算
  if d<=r
	  (r-d)/r
  else
	  1
  end
end

def distance(x, y, p, q)
  # 点(x,y)と点(p,q)の間の距離
  sqrt( (x-p)**2 + (y-q)**2)
end

def sphere(s)
  image = make2d(s,s)
  for y in 0..(s-1)
    for x in 0..(s-1)
      image[y][x] = b(s,x,y)
    end
  end
  image
end
