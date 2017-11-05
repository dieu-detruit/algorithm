include(Math)

require 'chunky_png' 
Height = 480
Width = 300

def flameseed(x)
	return 0.7*sin(4.0*x) + 0.3
end

def flamerise(x)
	x = 1.4 * (x - 3.0)
	return (cos(4.0*x) + cos(10.0*x) + sin(5.0*x))/3.0
end

# GhunkyPNGの描画用キャンバス
png = ChunkyPNG::Image.new(Width, Height, ChunkyPNG::Color::TRANSPARENT)


# 一時キャンバス
image = Array.new(Height+2){Array.new(Width, 0)}

# カラーインデックス
color = Array.new(128){[0, 0, 0]}

# カラーインデックスの作成
32.times do |i|
	color[i] = [8*i, 0, 0]
end

32.times do |i|
	color[32+i] = [255, 8*i, 0]
end

64.times do |i|
	color[64+i] = [255, 255, 4*i]
end


# 炎の作成
18.times do |count|
	# 火種をまく
	(Height+1).downto(Height) do |i|
		Width.times do |j|
			image[i][j] = rand < 0.6 ? 0 : 127
		end
	end

=begin
	(Height+1).downto(Height) do |i|
		Width.times do |j|
			var = j/Width.to_f
			temp = flameseed(var)
			image[i][j] = (temp > -0.3) ? 127.0 * temp.abs : 0
		end
	end
=end

	(Height-1).downto(0) do |i|
		(Width-2).downto(1) do |j|
			r1 = 0.6 + 0.4 * cos(j)
			r2 = 0.4 - 0.4 * cos(j)
			
			temp = (0.2*image[i][j] + (0.5+r1)*image[i+1][j-1] + (1.0-r1+r2)*image[i+1][j] + (1.5-r2)*image[i+1][j+1])/3.2
			image[i][j] = temp + ((temp<64) ? temp : 127-temp) * (flamerise((j.to_f/Width - 0.5)))**2 * rand * 0.013
		end
	end
end


# ChunkyPNGキャンバスに転写
(Height).times do |i|
	(Width).times do |j|
		png[j, i] = ChunkyPNG::Color.rgb(color[image[i][j].to_i][0], color[image[i][j].to_i][1], color[image[i][j].to_i][2])
	end
end


# 画像の保存
png.save('fire.png', :interlace => true)
