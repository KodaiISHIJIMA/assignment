require 'open-uri'

def httpget(uri, filename)
  File.open(filename, "w"){|file|
    open(uri){ |f|
      f.each_line{|line|
        file.puts line
      }
    }
  }
end

uri = "http://lecture.ecc.u-tokyo.ac.jp/~ctkaneko/pl/2016/xy.txt"
filename = "httpget.txt"

httpget(uri, filename)
