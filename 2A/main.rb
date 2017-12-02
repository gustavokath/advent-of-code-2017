sum = 0

$stdin.each_line do |line|
	numbers = line.split(' ')
	max = numbers.first.to_i
	min = numbers.first.to_i

	numbers.each { |num| 
		num = num.to_i
		min = num if num < min
		max = num if num > max
	}

	sum += max - min
end

p sum
