def get_directions(dir_x, dir_y, state)
  case state
  when '#'
    return dir_y * -1, 0 if dir_y != 0
    return 0, dir_x
  when '.', nil
    return dir_y, 0 if dir_y != 0
    return 0, dir_x * -1
  when 'W'
    return dir_x, dir_y
  when 'F'
    return dir_x * -1, 0 if dir_x != 0
    return 0, dir_y * -1
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

for i in 1..10000000
  key = "#{x} #{y}"
  state = hash[key]
  dir_x, dir_y = get_directions(dir_x, dir_y, state)

  case state
  when '#'
    hash[key] = 'F'
  when '.', nil
    hash[key] = 'W'
  when 'W'
    hash[key] = '#'
    count += 1
  when 'F'
    hash[key] = '.'
  end

  x += dir_x
  y += dir_y
end

p count

