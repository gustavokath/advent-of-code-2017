a = gets().to_i
b = gets().to_i

count = 0
multA = 16807;
multB = 48271;
divide = 2147483647;
mask = 0xFFFF;
a_queue = []
b_queue = []
while a_queue.length < 5000000 || b_queue.length < 5000000
  a = (a * multA) % divide
  b = (b * multB) % divide

  a_queue.push(a) if (a % 4) == 0
  b_queue.push(b) if (b % 8) == 0
end

for i in 0..4999999
  if(a_queue[i] & mask) == (b_queue[i] & mask)
    count += 1
  end
end

p count