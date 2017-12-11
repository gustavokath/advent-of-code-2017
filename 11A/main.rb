moves = $stdin.readline.chomp.split(',')

x = 0
y = 0
z = 0
for cmd in moves
  case cmd
  when 'n'
    x += 1
    z -= 1
  when 'ne'
    y -= 1
    x += 1
  when 'nw'
    y += 1
    z -= 1
  when 'sw'
    x -= 1
    y += 1
  when 'se'
    z += 1
    y -= 1
  when 's'
    x -= 1
    z += 1
  end
end


p "x:#{x} y:#{y} z:#{z}"
p [x.abs, y.abs, z.abs].max

