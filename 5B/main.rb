array = []
count = 0
$stdin.each_line do |line|
  array.push(line.to_i)
end

i = 0
while i < array.size do
  jump = array[i]
  if jump >= 3
    array[i] -= 1
  else
    array[i] += 1
  end
  i += jump
  count += 1
end
p count