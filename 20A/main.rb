class Particle
  attr_accessor :p, :v, :a, :id

  def initialize(p, v, a, id)
    @id = id
    @p = p
    @v = v
    @a = a
  end

  def distance(a)
    sum = 0
    a.each { |p| sum += p.abs}
    sum
  end
end

particles = []
i = 0
$stdin.each_line do |line|
  numbers = line.scan(/[-]?\d+/).map(&:to_i)
  particles.push(Particle.new(numbers[0..2], numbers[3..5], numbers[6..8], i))
  i += 1
end

result = particles.sort_by{ |x| [x.distance(x.a), x.distance(x.v)] }
p result.first.id