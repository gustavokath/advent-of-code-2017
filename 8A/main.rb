def check(reg, op, value, hash)
  hash[reg] = 0 unless hash.key? reg

  if op == '<'
    return hash[reg] < value
  elsif op == '>'
    return hash[reg] > value
  elsif op == '<='
    return hash[reg] <= value
  elsif op == '>='
    return hash[reg] >= value
  elsif op == '=='
    return hash[reg] == value
  elsif op == '!='
    return hash[reg] != value
  end
end


def opration(reg, op, value, hash)
  hash[reg] = 0 unless hash.key? reg

  if op == 'inc'
    hash[reg] += value
  elsif op == 'dec'
    hash[reg] -= value
  end
end

hash = {}

$stdin.each_line do |line|
  instructions = line.chomp().split(' ')
  reg = instructions[0]
  op = instructions[1]
  value = instructions[2].to_i

  reg_check = instructions[4]
  check_op = instructions[5]
  value_check = instructions[6].to_i

  if check(reg_check, check_op, value_check, hash)
    opration(reg, op, value, hash)
  end
end

max = -1
hash.each do |key, value|
  max = value if max < value
end

p max




