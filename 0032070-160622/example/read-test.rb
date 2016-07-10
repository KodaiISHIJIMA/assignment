File.open("file-test.txt", "r"){ |file|
  file.each{ |line|
    puts line
  }
}
