def exchange(array, a, b)
  aux = array[a]
  array[a] = array[b]
  array[b] = aux
end

def partner(array, a, b)
  a_index = array.find_index(a)
  b_index = array.find_index(b)

  exchange(array, a_index, b_index)
end

array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p']
#array = ['a', 'b', 'c', 'd', 'e']
cmds = $stdin.readline.chomp.split(',')

for cmd in cmds
  p array
  case cmd[0]
  when 's'
    num = cmd[/\d+/].to_i
    array = array.rotate(num * -1)
  when 'x'
    cmd_nums = cmd[1..-1].split('/').map(&:to_i)
    exchange(array, cmd_nums[0], cmd_nums[1])
  when 'p'
    partner(array, cmd[1], cmd[3])
  end
end
p array
p array.join('')