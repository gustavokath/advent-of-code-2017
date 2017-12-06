def find_biggest(array)
  biggest = 0
  index = 0
  array.each_with_index do |n,i|
    if biggest <= n
      biggest = n
      index = i
    end
  end
  return index
end

count = 0
hash = {}
start_index = 0

array = $stdin.readline.chomp.split(' ').map(&:to_i)
p array

while(!hash.key? array) do
  hash[array.clone] = true
  index = find_biggest(array)
  value = array[index]
  array[index] = 0

  while(value < 0) do
    index += 1
    array[index % 16] += 1
  end

  count += 1
  start_index += 1
end

p count
