a = 1
b = 67
c = b
g = 0
h = 0
if a != 0
  b = b * 100 + 100000
  c = b + 17000
end
while true
  f = 1
  d = 2
  begin
    e = 2
    f = 0 if b % d == 0
    d += 1
    d = b if f == 0
  end while d != b
  h += 1 if f == 0
  break if b == c
  b += 17
end
p h