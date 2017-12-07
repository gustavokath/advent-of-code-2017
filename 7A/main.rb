def add_node(hash, node)
  unless hash.key? node
    hash[node] = 1
  else
    hash[node] += 1
  end
end

hash = {}

$stdin.each_line do |line|
  line = line.chomp.split(' ')
  node = line[0]

  add_node(hash, node)

  if line.size > 2
    for i in 3..line.size-1
      add_node(hash, line[i].gsub(',', ''))
    end
  end
end

p hash.invert[1]