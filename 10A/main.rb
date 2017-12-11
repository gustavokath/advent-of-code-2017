def reverse(array, start_i, end_i)
  size = array.size
  len = end_i - start_i + 1
  index = 0

  while index < len/2
    first = (start_i + index) % size
    last = (end_i - index) % size
    aux = array[first]
    array[first] = array[last]
    array[last] = aux

    index += 1
  end

  return array
end

lengths = $stdin.readline.chomp.split(',').map(&:to_i)

array = Array.new(256) { |i| i }

index = 0
skip_size = 0
for len in lengths
  start_i = index
  end_i = index + (len-1)

  array = reverse(array, start_i, end_i)

  index += len + skip_size
  skip_size += 1
end

p array

p array[0] * array[1]


