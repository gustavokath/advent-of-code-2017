def get_next(matrix,x, y, dir_x, dir_y, change)
  return nil, nil, false if matrix[y][x] == ' '
  if change
    if  dir_x == 0 && x < @len_x-1 && matrix[y][x+1] != ' '
      return 1, 0, false
    end
    if  dir_x == 0 && x > 0 && matrix[y][x-1] != ' '
      return -1, 0, false
    end

    if  dir_y == 0 && y < @len_y-1 && matrix[y+1][x] != ' '
      return 0, 1, false
    end
    if dir_y == 0 && y > 0 && matrix[y-1][x] != ' '
      return 0, -1, false
    end
  else
    if matrix[y+dir_y][x+dir_x] == '+'
      return dir_x, dir_y, true
    else
      return dir_x, dir_y, false
    end
  end
  return nil, nil, false
end

matrix = []
x = 0
y = 0
dir_x = 0
dir_y = 1
next_step = 'down'
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
  if matrix[y][x] != '|' && matrix[y][x] != '-' && matrix[y][x] != '+' && matrix[y][x] != ' '
    path += matrix[y][x]
  end

  dir_x, dir_y, change = get_next(matrix, x, y, dir_x, dir_y, change)
  unless dir_x.nil?
    x += dir_x
    y += dir_y
    count += 1
  end
end
p path
p count
