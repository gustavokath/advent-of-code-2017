def check_reg(x)
  @reg[x] = 0 unless @reg.key? x
end

def snd(x)
  @last_played = @reg[x]
end

def set(x, y)
  @reg[x] = y
end

def add(x, y)
  @reg[x] += y
end

def mul(x, y)
  @reg[x] *= y
end

def mod(x, y)
  @reg[x] = @reg[x] % y
end

def rcv(x)
  if @reg[x] != 0
    p @last_played
    exit
  end
end

def jgz(x, y)
  return y if @reg[x] > 0
  return nil
end

@reg = {}
intructions = []
$stdin.each_line do |line|
  intructions.push(line.chomp)
end
cursor = 0
@last_played = 0

while cursor < intructions.length
  inst = intructions[cursor]
  params = inst.split(' ')
  op = params[0]
  x = params[1]
  y = Integer(params[2]) rescue y = params[2]
  unless y.is_a? Integer
    y = @reg[y]
  end

  check_reg(x)
  case op
  when 'snd'
    snd(x)
  when 'set'
    set(x, y)
  when 'add'
    add(x, y)
  when 'mul'
    mul(x, y)
  when 'mod'
    mod(x, y)
  when 'rcv'
    rcv(x)
  when 'jgz'
    res = jgz(x, y)
    unless res.nil?
      cursor += res
      next
    end
  end
  cursor += 1
end