# kaneko-sensei

def abbreviation(word)
  str = word
  num = str.length - 2

  return str[0]+num.to_s+str[-1]
end

print abbreviation("internationalization"), "\n"
