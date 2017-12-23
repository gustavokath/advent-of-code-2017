a = 0
b = 67
c = b
g = 0
count = 0
if a != 0
  b *= 100
  count += 1
  b -= -100000
  c = b + 17000
end
while true
  f = 1
  d = 2
  begin
    e = 2
    begin
      g = d
      g *= e
      count += 1
      g -= b
      f = 0 if g == 0
      e += 1
      g = e
      g -= b
    end while g != 0
    d += 1
    g = d
    g -= b
  end while g != 0
  h += 1 if f == 0
  g = b
  g -= c
  break if g == 0
  b += 17
end
p count