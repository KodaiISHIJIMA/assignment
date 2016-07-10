# coding: utf-8
include Math

def koch(x0,y0,x1,y1,n)
  if n == 0
    [[x0,y0]]
  else
    # 直線を三等分する点s,tを求める
    x_s = (x1 + 2 * x0) / 3.0
    y_s = (y1 + 2 * y0) / 3.0
    x_t = (2 * x1 + x0) / 3.0
    y_t = (2 * y1 + y0) / 3.0

    # 線分stを一辺とする正三角形を作る点uを求める
    x_u = x_s + ((x_t - x_s) - sqrt(3)*(y_t - y_s))/2.0
    y_u = y_s + (sqrt(3) *(x_t - x_s) + (y_t - y_s))/2.0

    # すでにある線分それぞれに」kochを当てはめていく
    koch(x0,y0,x_s,y_s,n-1) + koch(x_s,y_s,x_u,y_u,n-1) + koch(x_u,y_u,x_t,y_t,n-1) + koch(x_t,y_t,x1,y1,n-1)
  end
end

a = koch(0,0,100,0,3)

a.each{|x,y| printf("%.3f %.3f\n", x, y)}
