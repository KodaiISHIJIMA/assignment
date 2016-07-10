# coding: utf-8
# MyTronBot
# Author: Kodai ISHIJIMA
# 
# 基本的な作戦として、壁が少ない方へ向かう
#
# # #
# #2###
# #
#
# となっているときは下へと向かう
#

load "map.rb"
load "printing.rb"

#NB: This AI communicates with the contest engine over
#standard out. printing.rb contains convenience methods
#which overload the puts, p and print methods such that
#they output to standard error instead.

class TronBot
  def makemove(map)
    x, y = map.my_position
    opp_x, opp_y = map.opponent_position

    valid_moves = []
    valid_moves << :NORTH if not map.wall?(x, y-1)
    valid_moves << :SOUTH if not map.wall?(x, y+1)
    valid_moves << :WEST  if not map.wall?(x-1, y)
    valid_moves << :EAST  if not map.wall?(x+1, y)

    angle = wall_direction(map, x, y)
    move = determine_direction(map, valid_moves, angle)
    map.make_move( move )
  end

  # 壁が多くある方向を求める
  def wall_direction(map, x, y)
    around_wall = Array.new(3){Array.new(3)}

    for i in 0..2
      for j in 0..2
        if map.wall?((x-1)+i, (y-1)+j)
          around_wall[i][j] = 1
        else
          around_wall[i][j] = 0
        end
      end
    end

    around_wall_x = 0
    around_wall_y = 0

    for i in 0..2
      for j in 0..2
        around_wall_x = around_wall_x + (i-1)*around_wall[i][j]
        around_wall_y = around_wall_y + (j-1)*around_wall[i][j]
      end
    end

    Complex(around_wall_x, around_wall_y).arg
  end

  # 壁が少ない方向へ向く
  def determine_direction(map, valid_moves, angle)

    # 東西南北が壁のときは仕方がないので北へ向かう
    if(valid_moves.size == 0)
      :NORTH

    # 東西方向に多いとき
    elsif angle >= Complex(0,0).arg and angle < Complex(0,1).arg
      if valid_moves.index( :WEST )
        :WEST
      elsif valid_moves.index( :NORTH )
        :NORTH
      else
        valid_moves[rand(valid_moves.size)]
      end

    # 南西方向に多いとき
    elsif angle >= Complex(0,1).arg and angle <= Complex(-1,0).arg
      if valid_moves.index( :EAST )
        :EAST
      elsif valid_moves.index( :NORTH )
        :NORTH
      else
        valid_moves[rand(valid_moves.size)]
      end

    # 北東方向に多いとき
    elsif angle < Complex(0,0).arg and angle >= Complex(0,-1).arg
      if valid_moves.index( :WEST )
        :WEST
      elsif valid_moves.index( :SOUTH )
        :SOUTH
      else
        valid_moves[rand(valid_moves.size)]
      end

    # 北西方向に多いとき
    elsif angle < Complex(0,-1).arg and angle >= Complex(-1,-0).arg
      if valid_moves.index( :EAST )
        :EAST
      elsif valid_moves.index( :SOUTH )
        :SOUTH
      else
        valid_moves[rand(valid_moves.size)]
      end

    # 漏れがあった場合
    else
      valid_moves[rand(valid_moves.size)]
    end
  end

  def initialize	
    while(true)		
      map = Map.new()
      makemove(map)
    end	
  end
	
end

TronBot.new()
