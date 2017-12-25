class State
  attr_accessor :name, :operations

  def initialize(name, operations=[])
    @name = name
    @operations = operations
  end
end

class Operation
  attr_accessor :write, :move, :next_state

  def initialize(write, move, next_state)
    @write = write
    @move = move
    @next_state = next_state
  end
end

start = $stdin.readline.chomp.scan(/\w\./).first.gsub('.','')
steps = $stdin.readline.chomp.scan(/\d+/).first.to_i
states = {}
tape = {}

while true
  line = $stdin.readline rescue break
  state_name = $stdin.readline.chomp.scan(/.:/).first.gsub(':','')
  operations = []
  for i in 0..1
    cur_value = $stdin.readline.chomp.scan(/\d/).first.to_i
    write = $stdin.readline.chomp.scan(/\d/).first.to_i
    move = $stdin.readline.chomp.scan(/left|right/).first
    next_state = $stdin.readline.chomp.scan(/\w\./).first.gsub('.','')
    move == 'left' ? move = -1 : move = 1
    operations.push(Operation.new(write, move, next_state))
  end
  state = State.new(state_name, operations)
  states[state_name] = state
end

cursor = 0
cur_state = 'A'

for i in 1..steps
  tape[cursor] = 0 unless tape.key? cursor

  state = states[cur_state]
  value = tape[cursor]

  operation = state.operations[value]
  tape[cursor] = operation.write
  cursor += operation.move
  cur_state = operation.next_state
end

p tape.values.count(1)
