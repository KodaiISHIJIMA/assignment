# kaneko-sensei

def watch(s)
  ss = s % 60
  min = s / 60
  mm = min % 60
  hh = min / 60

  return hh.to_s+":"+mm.to_s+":"+ss.to_s

end

print watch(46979), "\n"
