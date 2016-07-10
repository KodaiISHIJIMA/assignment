# coding: utf-8
include Math

# fileにx,yを書き込む
def write_to_file2d(filename, x, y)
  File.open(filename, "w"){ |file|
    for i in 0..x.length-1
      file.print x[i], " ", y[i], "\n"
    end
  }
end

# 配列x,yを作成(y = sin(x))
x = (0..100).to_a
y = []

for i in 0..x.length-1
  x[i] = x[i]/10.0
end

for i in 0..x.length-1
  y << sin(x[i])
end

# fileにx,yを書き込む
write_to_file2d("writeToFile2d.txt", x, y)
