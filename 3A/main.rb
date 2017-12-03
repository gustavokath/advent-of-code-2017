def rec(num)
  cur = 9
  prev = 0
  pow = 2
  while cur <= num do
    prev = cur
    cur += 8*pow
    pow += 1
  end

  return pow-1, prev, cur
end


num = gets().to_i
loop_dist, prev, cur = rec(num)

if(cur == num)
  return loop_dist*2
end

moves = loop_dist
while(cur > num) do
  cur -= 1
  moves -= 1

  moves = loop_dist if moves == (loop_dist*-1)
end

p loop_dist + moves.abs