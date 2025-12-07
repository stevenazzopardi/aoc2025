{:ok, contents} = File.read("puzzleinput4.txt")
filterContents = String.split(contents, "\n", trim: true)
rows = Enum.map(Enum.with_index(filterContents), fn x -> {String.graphemes(elem(x,0)), elem(x,1)} end)
loop = Enum.flat_map(rows, fn x -> index = elem(x,1)
currentRow = Enum.with_index(elem(Enum.at(rows, index), 0))
previousIndex = if index-1 < 0 do length(rows) else index-1 end
previousRow = if Enum.at(rows, previousIndex) != nil do Enum.with_index(elem(Enum.at(rows, previousIndex), 0)) end
nextRowIndex = if index+1 > length(rows) do nil else index+1 end
nextRow = if Enum.at(rows, nextRowIndex) != nil do Enum.with_index(elem(Enum.at(rows, nextRowIndex), 0)) end

Enum.filter(currentRow, fn y -> 
if elem(y,0) == "@" do
right = if elem(y,1) >= length(currentRow) do nil else Enum.at(currentRow, elem(y,1)+1) end
left = if elem(y,1) <= 0 do nil else Enum.at(currentRow, elem(y,1)-1) end
top = if previousRow != nil do Enum.at(previousRow, elem(y,1)) end
bottom = if nextRow != nil do Enum.at(nextRow, elem(y,1)) end
topleft = if previousRow != nil do if elem(y,1)-1 < 0 do nil else Enum.at(previousRow, elem(y,1)-1) end end
topright = if previousRow != nil do if elem(y,1)+1 >= length(currentRow) do nil else Enum.at(previousRow, elem(y,1)+1) end end
bottomleft = if nextRow != nil do if elem(y,1) - 1 < 0 do nil else Enum.at(nextRow, elem(y,1)-1) end end
bottomright = if nextRow != nil do if elem(y,1) + 1 >= length(currentRow) do nil else Enum.at(nextRow, elem(y,1)+1) end end
right = if right == nil do {"."} else right end
left = if left == nil do {"."} else left end
top = if top == nil do {"."} else top end
bottom = if bottom == nil do {"."} else bottom end
bottomleft = if bottomleft == nil do {"."} else bottomleft end
bottomright = if bottomright == nil do {"."} else bottomright end
topleft = if topleft == nil do {"."} else topleft end
topright = if topright == nil do {"."} else topright end

count = Enum.filter([elem(top,0), elem(bottom,0), elem(right,0), elem(left,0), elem(topright,0), elem(topleft,0), elem(bottomleft,0), elem(bottomright,0)], fn x-> x == "@" end)
count = Enum.count(count)
count < 4
end
end)
end)
IO.inspect(length(loop))
