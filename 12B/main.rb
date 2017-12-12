class Node
  attr_accessor :id, :nexts, :visited

  def initialize(id)
    @id = id
    @nexts = []
    @visited = false
  end
end

hash = {}

def create(hash, id, list)
  unless hash.key? id
    node = Node.new(id)
    node.nexts = list
    hash[id] = node
  else
    node = hash[id]
    node.nexts = list if node.nexts.empty?
  end
end

def run(node, hash)
  return 0 if node.visited

  count = 1
  node.visited = true
  for n in node.nexts
    count += run(hash[n], hash)
  end

  return count
end

$stdin.each_line do |line|
  values = line.chomp.split(' ')
  list = values[2..values.size-1]
  list = list.map{|v| v.gsub(',', '').to_i }

  create(hash, values[0].to_i, list)
end

count = 0
hash.each do |k, v|
  unless v.visited
    result = run(v, hash)
    count += 1 if result != 0
  end
end
p count