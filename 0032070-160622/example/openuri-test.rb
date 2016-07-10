require 'open-uri'

open("http://www.ecc.u-tokyo.ac.jp"){|f|
  f.each_line{|line|
    puts line
  }
}
