def next_cell_living(living, neighbor_count)
  if neighbor_count == 3
    return 1
  elsif neighbor_count == 2
    if living == 1
      return 1
    else
      return 0
    end
  else
    return 0
  end
end

p next_cell_living(0,2)
