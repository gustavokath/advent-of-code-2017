steps = gets().to_i

pointer = 0
array = [0]

for i in 1..2017
  pointer = (pointer + steps)  % array.length
  array.insert(pointer+1, i)
  pointer += 1
end
p array[(pointer+1) % array.length]