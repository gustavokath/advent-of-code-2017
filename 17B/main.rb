steps = gets().to_i

pointer = 0
pointer_zero = 0
after = 0

for i in 1..50000000
  pointer = ((pointer + steps)  % i) + 1
  if pointer <= pointer_zero
    pointer_zero += 1
  else
    after =  i if pointer == pointer_zero+1
  end
end
p after