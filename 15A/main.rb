a = gets().to_i
b = gets().to_i

count = 0
multA = 16807;
multB = 48271;
divide = 2147483647;
mask = 0xFFFF;
for i in 1..40000000
  a = (a * multA) % divide
  b = (b * multB) % divide

  count += 1 if(a & mask) == (b & mask)
end
p count