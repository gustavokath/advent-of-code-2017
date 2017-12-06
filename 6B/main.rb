def find_biggest(array)
  biggest = 0
  index = 0
  array.each_with_index do |n,i|
    if biggest < n
      biggest = n
      index = i
    end
  end
  return index
end

def array_hash(array)
  array.map{|k|"#{k}"}.join('')
end

count = 0
hash = {}

array = $stdin.readline.chomp.split(' ').map(&:to_i)

array_h = array_hash(array)
while(!hash.key? array_h) do
  hash[array_h] = count
  index = find_biggest(array)
  value = array[index]
  array[index] = 0

  while(value > 0) do
    index += 1
    array[index % array.size] += 1
    value -= 1
  end

  count += 1
  array_h = array_hash(array)
end
p count - hash[array_h]