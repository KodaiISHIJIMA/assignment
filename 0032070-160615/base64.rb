# coding: utf-8
require 'base64'

# encode
enc = Base64.encode64('石嶋紘大')
puts enc

# decode
dec = Base64.decode64(enc)
puts dec

# result
# $ ruby base64.rb
# 55+z5baL57SY5aSn
# 石嶋紘大
