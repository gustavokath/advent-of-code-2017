class Node
  attr_accessor :name, :value, :child_value, :child

  def initialize(name)
    @child = []
    @name = name
    @child_value = 0
  end
end

def add_node(hash, name, node)
  unless hash.key? name
    hash[name] = node
  else
    hash[name].value = node.value
    node = hash[name]
  end

  return node
end

def calculate(node, str="")
  return node.value if node.child.empty?

  sum = 0
  cur = nil
  for c in node.child
    child_value = calculate(c, str + "    ")
    cur = child_value if cur.nil?

    if cur < child_value
      right_value = c.value - (child_value - cur)
      child_value = (child_value - c.value) + right_value
      c.value = right_value
      p right_value
    end

    sum += child_value
  end

  node.child_value = sum
  return node.value + sum
end

hash = {}

$stdin.each_line do |line|
  line = line.chomp.split(' ')
  val = line[1].gsub('(', '').gsub(')', '')
  val = val.to_i
  node = Node.new(line[0])
  node.value = val

  node = add_node(hash, node.name, node)

  if line.size > 2
    for i in 3..line.size-1
      name = line[i].gsub(',', '')

      unless hash.key? name
        child = Node.new(name)
      else
        child = hash[name]
      end

      add_node(hash, child.name, child)
      node.child.push(child)
    end
  end
end

root = hash['ahnofa']
calculate(root)




