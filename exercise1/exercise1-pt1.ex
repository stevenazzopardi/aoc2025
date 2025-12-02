{:ok, contents} = File.read("puzzle1input.txt")
filterContents = contents |> String.split("\n", trim: true)
chunks = [{"C", "50"} | Enum.map(filterContents, fn x -> String.split_at(x, 1) end)]
abc = Enum.map_reduce(chunks, 0, fn x, acc -> remain = rem(String.to_integer(elem(x,1)), 100)
						if elem(x,0) == "L" do
							
						newval = if remain>acc do (acc-remain)+100 else (acc-remain) end
						{newval, newval} 
						else 
						if elem(x,0) == "C" do
						{String.to_integer(elem(x,1)), String.to_integer(elem(x,1))}
						else
						newval = rem(acc+remain,100)
						{newval,newval}
						end
						end
					end)
password = Enum.count(elem(abc,0), fn x -> x == 0 end)
IO.inspect(password)
