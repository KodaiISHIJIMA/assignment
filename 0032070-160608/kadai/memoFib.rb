# coding: utf-8
require('./counter.rb')

class MemoFib
  def initialize
    @counter = Counter.new
    @memo = []
  end
  def fib(n)
    # @memo[n]がわからないときは定義に従って求める
    if @memo[n] == nil
      @counter.increment
      if n == 0
        @memo[n] = 0
      elsif n == 1
        @memo[n] = 1
      else
        @memo[n] = fib(n-1)+fib(n-2)
      end
    end
    # @memo[n]が既にわかっているときは直接返す
    @memo[n]
  end
  def counter
    @counter.counter
  end
end
