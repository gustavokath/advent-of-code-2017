sum = 0

$stdin.each_line do |line|
	numbers = line.split(' ').map(&:to_i)

	for sub in numbers.permutation(2).to_a do
		if (sub.first % sub.last) == 0
			sum += sub.first / sub.last
			break
		end	
	end
end

p sum
