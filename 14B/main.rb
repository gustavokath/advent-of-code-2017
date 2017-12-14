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

  array
end

def make_hash(str)
  lengths = []
  default_lens = [17, 31, 73, 47, 23]
  str.each_char do |c|
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

      array = reverse(array, start_i, end_i)

      index += len + skip_size
      skip_size += 1
    end
  end

  dense_hash = Array.new(16)

  for i in (0..15)
    offset = i*16
    value = array[offset]
    for j in (1..15)
      value ^= array[offset+j]
    end
    dense_hash[i] = value
  end

  hash = ''
  dense_hash.map do |v|
     hex = v.to_s(16)
     hex = '0' + hex if hex.size < 2
     hash += hex
  end
  hash
end

def fill_matrix(i,j, matrix, value)
  return if matrix[i][j] != '1'
  matrix[i][j] = value

  fill_matrix(i-1, j, matrix, value) if i > 0
  fill_matrix(i+1, j, matrix, value) if i < 127
  fill_matrix(i, j-1, matrix, value) if j > 0
  fill_matrix(i, j+1, matrix, value) if j < 127

end

str = gets()

biggest_num = 1
matrix = []
for i in 0..127
  hash = make_hash("#{str}-#{i}")
  bin = hash.to_i(16).to_s(2)
  while bin.length < 128
    bin = '0' + bin
  end
  bin = bin.split('')
  matrix.push(bin)
end

for i in 0..127
  for j in 0..127
    if matrix[i][j] == '1'
      biggest_num += 1
      fill_matrix(i, j, matrix, biggest_num)
    end
  end
end
p biggest_num-1