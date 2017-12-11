line = $stdin.readline.chomp

score = 0
level = 0
garbege_open = false
ignore_next = false
line.each_char do |c|
  if ignore_next
    ignore_next = false
  elsif c == '!'
    ignore_next = true
  elsif garbege_open && c == '>'
    garbege_open = false
  elsif garbege_open
    next
  elsif c == '{'
    level += 1
  elsif c == '}' && level != 0
    score += level
    level -= 1
  elsif c == '<'
    garbege_open = true
  end
end

p score