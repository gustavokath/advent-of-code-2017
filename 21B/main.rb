def to_matrix(str)
  str.split('/')
end

def rotate(m)
  reversed = m.reverse
  tranposed = m.map(&:chars).transpose.map(&:join)
  tranposed_reversed = tranposed.map(&:reverse)
  [ reversed, m.map(&:reverse), reversed.map(&:reverse),
    tranposed, tranposed.reverse,tranposed_reversed, tranposed_reversed.reverse ]
end

def break_in(m, div)
  parts = []
  i = 0
  for line in m
    parts[i/div] = []  if i % div == 0
    parts[i/div].push(line.scan(/.{#{div}}/))
    i += 1
  end

  for i in 0..parts.length-1
    parts[i] = parts[i].transpose
  end
  parts
end

mapping = {}

$stdin.each_line do |line|
  pattern, result = line.split(' => ')
  result = to_matrix(result.chomp)
  pattern = to_matrix(pattern.chomp)
  mapping[pattern] = result

  for p in rotate(pattern)
    mapping[p] = result
  end
end

matrix = ['.#.', '..#', '###']

for i in 1..18
  tmp = []
  if (matrix.first.length % 2) == 0
    to_change = break_in(matrix, 2)
  else
    to_change = break_in(matrix, 3)
  end

  for i in 0..to_change.length-1
    for j in 0..to_change[i].length-1
      to_change[i][j] = mapping[to_change[i][j]]
    end
  end

  for i in 0..to_change.length-1
    to_change[i] = to_change[i].transpose.map(&:join)
  end

  to_change = to_change.flatten(1)

  matrix = to_change
end

p matrix.join.count('#')