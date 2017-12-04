count = 0
$stdin.each_line do |line|
  hash = {}
  str_array = line.split(' ')
  error = false

  for part in str_array do
    p part
    unless hash.key? part
      hash[part] = true
    else
      error = true
      break
    end
  end
  count += 1 unless error
end
p count



