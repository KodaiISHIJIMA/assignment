# coding: utf-8
# MyTronBot
# Author: Kodai ISHIJIMA
# 
# 基本的な作戦として壁が少ない方へ向かう
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

    # 周りの壁の数を数えて、壁が少ない方に進む
    now_wall = Array.new(3){Array.new(3)}
    for i in 0..2
      for j in 0..2
        if map.wall?((x-1)+i, (y-1)+j)
          now_wall[i][j] = 1
        else
          now_wall[i][j] = 0
        end
      end
    end

    wall_point_x = 0
    wall_point_y = 0
    for i in 0..2
      for j in 0..2
        wall_point_x = wall_point_x + (i-1)*now_wall[i][j]
        wall_point_y = wall_point_y + (j-1)*now_wall[i][j]
      end
    end

    angle = Complex(wall_point_x, wall_point_y).arg
    # p wall_point_x, wall_point_y, angle

    if(valid_moves.size == 0)
      map.make_move( :NORTH )
    elsif angle >= Complex(0,0).arg and angle <= Complex(0,1).arg
      if valid_moves.index( :WEST )
        map.make_move( :WEST )
      elsif valid_moves.index( :NORTH )
        map.make_move( :NORTH )
      else
        move = valid_moves[rand(valid_moves.size)]
      end
    elsif angle >= Complex(0,1).arg and angle <= Complex(-1,0).arg
      if valid_moves.index( :EAST )
        map.make_move( :EAST )
      elsif valid_moves.index( :NORTH )
        map.make_move( :NORTH )
      else
        move = valid_moves[rand(valid_moves.size)]
      end
    elsif angle <= Complex(0,0).arg and angle >= Complex(0,-1).arg
      if valid_moves.index( :WEST )
        map.make_move( :WEST )
      elsif valid_moves.index( :SOUTH )
        map.make_move( :SOUTH )
      else
        move = valid_moves[rand(valid_moves.size)]
      end
    elsif angle <= Complex(0,-1).arg and angle >= Complex(-1,-0).arg
      if valid_moves.index( :EAST )
        map.make_move( :EAST )
      elsif valid_moves.index( :SOUTH )
        map.make_move( :SOUTH )
      else
        move = valid_moves[rand(valid_moves.size)]
      end
    else
      move = valid_moves[rand(valid_moves.size)]
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
