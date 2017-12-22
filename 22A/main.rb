def get_directions(dir_x, dir_y, infected)
  if infected
    return dir_y * -1, 0 if dir_y != 0
    return 0, dir_x
  else
    return dir_y, 0 if dir_y != 0
    return 0, dir_x * -1
  end
end

hash = {}
dir_y = -1
dir_x = 0
count = 0
y = 0
x = 0

$stdin.each_line do |line|
  line = line.chomp.split('')
  x = 0
  for c in line
    hash["#{x} #{y}"] = '#' if c == '#'
    x += 1
  end
  y += 1
end

len_x = x
len_y = y

x = len_x / 2
y = len_y / 2

for i in 1..10000
  key = "#{x} #{y}"
  infected = hash.key? key
  dir_x, dir_y = get_directions(dir_x, dir_y, infected)

  if infected
    hash.delete(key)
  else
    hash[key] = '#'
    count += 1
  end

  x += dir_x
  y += dir_y
end

p count

