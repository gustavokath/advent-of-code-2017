class Particle
  attr_accessor :p, :v, :a, :id, :colided

  def initialize(p, v, a, id)
    @id = id
    @p = p
    @v = v
    @a = a
    @colided = false
  end

  def sum(a, b)
    a.zip(b).map{ |pair| pair.reduce(&:+) }
  end

  def update_velocity
    @v = sum(@v, @a)
  end

  def update_position
    @p = sum(@p, @v)
  end

  def update
    update_velocity
    update_position
  end

  def distance
    sum = 0
    @p.each { |p| sum += p.abs }
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

limit = 100
no_colisions = 0
while true
  hash = {}
  colision = false
  for particle in particles
    unless particle.colided
      particle.update

      unless hash.key? particle.p
        hash[particle.p] = particle.id
      else
        particle.colided = true
        particles[hash[particle.p]].colided = true
        colision = true
      end

    end
  end

  if colision
    no_colisions =  0
  else
    no_colisions += 1
  end
  break if no_colisions > limit
end

count = 0
particles.each { |p| count += 1 unless p.colided }
p count