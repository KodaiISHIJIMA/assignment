# 参考にしたWebサイト
# http://msugai.fc2web.com/java/thread/diningPh.html

require 'thread'

class Fork
  # attr_accessor :id, :eating

  def initialize(i)
    @id = i
    @eating = false
    @mutex = Mutex.new
    @cv = ConditionVariable.new
  end

  def pick(i)
  	@mutex.synchronize do
  	  while @eating == true
  	  	puts i.to_s + " is starving"
  	  	@cv.wait(@mutex)
  	  end
  	  @eating = true
  	end
  end

  def down
  	@mutex.synchronize do
      @eating = false
      @cv.broadcast
    end
  end
end

class Philosopher
  # attr_accessor :id

  def initialize(i, eating, thinking, objs)
  	@id = i
  	@eatTime = eating
  	@thinkTime = thinking
  	@left = i
  	if @id != 0
  	  @right = @id - 1
  	else
  	  @right = 3
  	end
  	@forks = objs
  end

  def feelHungry
  	@forks[@left].pick(@id)
   	puts @id.to_s + " picks up " + @left.to_s
  	sleep(0.5942)
  	@forks[@right].pick(@id)
  	puts @id.to_s + " picks up " + @right.to_s
  	puts @id.to_s + " is eating"
  	sleep(@eatTime)
  	@forks[@left].down
  	puts @id.to_s + " puts " + @left.to_s
  	@forks[@right].down
  	puts @id.to_s + " puts " + @right.to_s
  end

  def think
  	sleep(@thinkTime)
  end

  def run
    loop do
      puts @id.to_s + " is thinking"
      self.think
      puts @id.to_s + " feels hungry"
      self.feelHungry
    end
  end
end

if __FILE__ === $0
  forks = []
  phils = []

  for i in 0..4
  	forks[i] = Fork.new(i)
  end

  random2 = Random.new(2)

  phils[0] = Philosopher.new(0, random2.rand, random2.rand, forks)
  phils[1] = Philosopher.new(1, random2.rand, random2.rand, forks)
  phils[2] = Philosopher.new(2, random2.rand, random2.rand, forks)
  phils[3] = Philosopher.new(3, random2.rand, random2.rand, forks)

  t0 = Thread.new{phils[0].run}
  t1 = Thread.new{phils[1].run}
  t2 = Thread.new{phils[2].run}
  t3 = Thread.new{phils[3].run}

  t0.join
  t1.join
  t2.join
  t3.join

end





















