array = []
count = 0
$stdin.each_line do |line|
  array.push(line.to_i)
end

i = 0
while i < array.size do
  jump = array[i]
  array[i] += 1
  i += jump
  count += 1
end
p count