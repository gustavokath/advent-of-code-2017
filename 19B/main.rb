def get_next(matrix,x, y, dir_x, dir_y, change)
  if change
    return 1, 0  if dir_x == 0 && x < @len_x-1 && matrix[y][x+1] != ' '
    return -1, 0 if dir_x == 0 && x > 0 && matrix[y][x-1] != ' '
    return 0, 1  if dir_y == 0 && y < @len_y-1 && matrix[y+1][x] != ' '
    return 0, -1 if dir_y == 0 && y > 0 && matrix[y-1][x] != ' '
  else
    return dir_x, dir_y if matrix[y][x] != ' '
  end
  return nil, nil
end

matrix = []
x = 0
y = 0
dir_x = 0
dir_y = 1
path = ''
change = false
count = 0

$stdin.each_line do |line|
  line = line.split('')
  line.pop
  matrix.push(line)
end
@len_x = matrix[0].length
@len_y = matrix.length
x = matrix[0].find_index('|')

while dir_x != nil && dir_y != nil
  path += matrix[y][x] if matrix[y][x] =~ /[A-Z]/

  dir_x, dir_y = get_next(matrix, x, y, dir_x, dir_y, matrix[y][x] == '+')
  unless dir_x.nil?
    x += dir_x
    y += dir_y
    count += 1
  end
end
p path
p count
