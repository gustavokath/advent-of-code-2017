def exchange(array, a, b, start, len, map)
  aux = array[a]
  array[a] = array[b]
  array[b] = aux
  map[array[a]] = a
  map[array[b]] = b
end

array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p']
map = {
  'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6,
  'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15
}

#map = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4 }
#array = ['a', 'b', 'c', 'd', 'e']

cmds = $stdin.readline.chomp.split(',')

start = 0
len = array.length
for cmd in cmds
  case cmd[0]
  when 's'
    num = cmd[/\d+/].to_i
    start = start - num
    start = len - start.abs if start < 0
  when 'x'
    cmd_nums = cmd[1..-1].split('/').map(&:to_i)
    exchange(array, (start + cmd_nums[0]) % len, (start + cmd_nums[1]) % len, start, len, map)
  when 'p'
    exchange(array, map[cmd[1]], map[cmd[3]], start, len, map)
  end
end

result = ''
for i in 0..(len-1)
  result += array[(start + i) % len]
end
p result