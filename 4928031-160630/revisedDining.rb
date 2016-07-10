# 参考にしたWebサイト
# 食事をする哲学者(Java)
# http://msugai.fc2web.com/java/thread/diningPh.html
# 
# セマフォ
# http://qiita.com/na-o-ys/items/62e9abc21c236908c958

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

  def initialize(i, eating, thinking, objs, locks)
  	@id = i
  	@eatTime = eating
  	@thinkTime = thinking
  	@left = i
    @right = (@id + 3) % 4
  	@forks = objs
    @locks = locks
  end

  def feelHungry
    puts @id.to_s + " feels hungry"
  	@forks[@left].pick(@id)
   	puts @id.to_s + " picks up " + @left.to_s
  	sleep(1)
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
    puts @id.to_s + " is thinking"
  	sleep(@thinkTime)
  end

  def run
    loop do
      self.think
      # lock = @locks.pop
      self.feelHungry
      # @locks.push lock
    end
  end
end

if __FILE__ === $0
  forks = []
  phils = []
  locks = Queue.new

  for i in 0..4
  	forks[i] = Fork.new(i)
  end

  3.times {locks.push :lock}

  random2 = Random.new(2)

  phils[0] = Philosopher.new(0, random2.rand, random2.rand, forks, locks)
  phils[1] = Philosopher.new(1, random2.rand, random2.rand, forks, locks)
  phils[2] = Philosopher.new(2, random2.rand, random2.rand, forks, locks)
  phils[3] = Philosopher.new(3, random2.rand, random2.rand, forks, locks)

  t0 = Thread.new{phils[0].run}
  t1 = Thread.new{phils[1].run}
  t2 = Thread.new{phils[2].run}
  t3 = Thread.new{phils[3].run}

  t0.join
  t1.join
  t2.join
  t3.join

end
