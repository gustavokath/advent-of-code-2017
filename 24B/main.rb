class Node
  attr_accessor :value, :used

  def initialize(value)
    @value = value
    @used = false
  end
end

def recursion(value, size, sum)
  @sum[size] = sum unless @sum.key? size
  @sum[size] = sum if @sum[size] < sum

  return 0 unless @mapping.key? value
  nexts = @mapping[value]
  max = 0
  for node in nexts
    unless node.used
      node.used = true
      for n in @mapping[node.value]
        n.used = true if n.value == value
      end

      result = recursion(node.value, size+1, sum + node.value + value)

      node.used = false
      for n in @mapping[node.value]
        n.used = false if n.value == value
      end
    end
  end
end


@mapping = {}
@sum = {}

$stdin.each_line do |line|
  num1, num2 = line.chomp.split('/').map(&:to_i)
  @mapping[num1] = [] unless @mapping.key? num1
  @mapping[num2] = [] unless @mapping.key? num2

  @mapping[num1].push(Node.new(num2)) unless @mapping[num1].any? { |item| item.value == num2 }
  @mapping[num2].push(Node.new(num1)) unless @mapping[num2].any? { |item| item.value == num1 }
end

starts = @mapping[0]
max = 0
for node in starts
  node.used = true
  for n in @mapping[node.value]
    n.used = true if n.value == 0
  end

  recursion(node.value, 1, node.value)

  node.used = false
  for n in @mapping[node.value]
    n.used = false if n.value == 0
  end
end
p @sum[@sum.keys.max]