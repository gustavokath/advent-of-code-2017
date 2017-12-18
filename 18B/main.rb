def check_reg(x, reg)
  reg[x] = 0 unless reg.key? x
end

def snd(x, reg, other_queue, value)
  other_queue.push(reg[x])
  return value+=1
end

def set(x, y, reg)
  reg[x] = y
end

def add(x, y, reg)
  reg[x] += y
end

def mul(x, y, reg)
  reg[x] *= y
end

def mod(x, y, reg)
  reg[x] = reg[x] % y
end

def rcv(x, reg, my_queue)
  return nil if my_queue.empty?
  reg[x] = my_queue.shift
end

def jgz(x, y, reg)
  x = Integer(x) rescue x = x
  unless x.is_a? Integer
    x = reg[x]
  end

  return y if x > 0
  return nil
end

def execute(cursor, intructions, reg, my_queue, other_queue, count, other_wait)
  while cursor < intructions.length
    inst = intructions[cursor]
    params = inst.split(' ')
    op = params[0]
    x = params[1]
    y = Integer(params[2]) rescue y = params[2]
    unless y.is_a? Integer
      y = reg[y]
    end

    check_reg(x, reg)
    case op
    when 'snd'
      count = snd(x, reg, other_queue, count)
      other_wait = false
    when 'set'
      set(x, y, reg)
    when 'add'
      add(x, y, reg)
    when 'mul'
      mul(x, y, reg)
    when 'mod'
      mod(x, y, reg)
    when 'rcv'
      res = rcv(x, reg, my_queue)
      return cursor, count, true, other_wait if res.nil?
    when 'jgz'
      res = jgz(x, y, reg)
      unless res.nil?
        cursor += res
        next
      end
    end
    cursor += 1
  end
  return cursor, count, false, other_wait
end

reg_0 = {'p' => 0}
reg_1 = {'p' => 1}
queue_0 = []
queue_1 = []
intructions = []
cursor_0 = 0
cursor_1 = 0
p0_count = 0
p1_count = 0
p0_wait = false
p1_wait = false


$stdin.each_line do |line|
  intructions.push(line.chomp)
end
len = intructions.length

while cursor_0 < len || cursor_1 < len
  if p0_wait && p1_wait
    break
  elsif p0_wait
    cursor_1, p1_count, p1_wait, p0_wait = execute(cursor_1, intructions, reg_1, queue_1, queue_0, p1_count, p0_wait)
  else
    cursor_0, p0_count, p0_wait, p1_wait = execute(cursor_0, intructions, reg_0, queue_0, queue_1, p0_count, p1_wait)
  end
end
p p1_count



