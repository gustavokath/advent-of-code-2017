def reverse(array, start_i, end_i)
  size = array.size
  len = end_i - start_i + 1
  index = 0

  #p "---------- BEGIN ------"

  while index < len/2
    first = (start_i + index) % size
    last = (end_i - index) % size
    #p "INDEX: #{index} #{len/2} -- F: #{first} - #{array[first]} L: #{last} - #{array[last]}"
    aux = array[first]
    array[first] = array[last]
    array[last] = aux

    index += 1
  end

  #p "---------- END ------"
  #p ""
  return array
end

lengths = []
default_lens = [17, 31, 73, 47, 23]
$stdin.readline.chomp.each_char do |c|
  lengths.push(c.ord)
end
lengths += default_lens

array = Array.new(256) { |i| i }

index = 0
skip_size = 0
for i in (1..64)
  for len in lengths
    start_i = index
    end_i = index + (len-1)

    #p "#{start_i} #{end_i} #{skip_size}"
    array = reverse(array, start_i, end_i)

    index += len + skip_size
    skip_size += 1

    #p array
    #p '----------------'
  end
end

dense_hash = Array.new(16)

p array

for i in (0..15)
  offset = i*16
  value = array[offset]
  for j in (1..15)
    value ^= array[offset+j]
  end
  dense_hash[i] = value
end

p dense_hash
hash = ''
dense_hash.map do |v|
   hex = v.to_s(16)
   hex = '0' + hex if hex.size < 2
   hash += hex
end
p hash
p hash.size



