# kaneko-sensei

def in_rectangle(w, h, x, y, r)

#   if r <= x and x <= (w-r) and r <= y and y <= (h-r)
#     return true
#   else
#     return false
#   end

  return (r <= x and x <= (w-r) and r <= y and y <= (h-r))
end

p in_rectangle(10, 10, 5, 8, 3)
