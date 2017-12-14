limit = {}
last_limit = 0
result = 0
$stdin.each_line do |line|
  line = line.chomp.split(': ').map(&:to_i)

  limit[line[0]] = line[1]
  last_limit = line[0]
end

time = 0
while true
  caught = false
  for i in 0..last_limit
    if limit.key? i
      recurence = (limit[i] - 2) * 2 + 2
      if (i+time) % recurence == 0
        caught = true
        break
      end
    end
  end
  break unless caught
  time += 1
end

p time