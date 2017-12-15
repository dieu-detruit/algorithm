#fibl, fibrの時間計測

require './bench.rb'
require './fib.rb'

command "set logscale y"

for k in 10..24
	run("fibl", k)
end

