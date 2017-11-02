require 'chunky_png'

Height = 400
Width = 400

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
100.times do
	# 火種をまく
	(Height+1).downto(Height) do |i|
		Width.times do |j|
			image[i][j] = (rand(2) == 0) ? 0 : 127
		end
	end

	r = 2*rand

	# ぼかしながらし押上げ
	(Height-1).downto(0) do |i|
		(Width-2).downto(1) do |j|
			temp = (image[i+1][j] + r*image[i+1][j-1] + (2-r)*image[i+1][j] + image[i+1][j+1] + image[i+2][j])/5.0;
			image[i][j] = ((temp<50) ? temp + 5.0*rand : temp).to_i
		end
	end
end


# ChunkyPNGキャンバスに転写
(Height).times do |i|
	(Width).times do |j|
		png[j, i] = ChunkyPNG::Color.rgb(color[image[i][j]][0], color[image[i][j]][1], color[image[i][j]][2])
	end
end


# 画像の保存
png.save('fire.png', :interlace => true)
