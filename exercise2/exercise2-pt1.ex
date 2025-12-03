{:ok, contents} = File.read("puzzle2input.txt")
filterContents = String.split(contents, ",", trim: true)
idranges = Enum.map(filterContents, fn x -> y = to_string(x) 
[a, b] = (String.split(y, "-", trim: true))
{a,b} end)
loopnumbers = Enum.map(idranges, fn x -> Enum.to_list(String.to_integer(elem(x,0))..String.to_integer(elem(x,1))) end)
pairs = Enum.map(loopnumbers, fn x -> Enum.map(x, fn y -> digits = Integer.digits(y) |> length()
							if rem(digits,2) == 0 do
							splitTuple = String.split_at(to_string(y), trunc(digits/2))
							if elem(splitTuple, 0) == elem(splitTuple,1) do y else 0 end
							else 0
							end end) end)
filtered = Enum.flat_map(pairs, fn x -> Enum.filter(x, fn y -> y > 0 end) end)
IO.inspect(filterContents)
IO.inspect(idranges)
IO.inspect(loopnumbers)
IO.inspect(filtered)
IO.inspect(Enum.sum(filtered))
