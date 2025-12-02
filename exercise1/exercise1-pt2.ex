{:ok, contents} = File.read("puzzle1input.txt")
_startPoint = 50
filterContents = contents |> String.split("\n", trim: true)
chunks = [{"C", "50"} | Enum.map(filterContents, fn x -> String.split_at(x, 1) end)]
abc = Enum.map_reduce(chunks, 0, fn x, acc -> 	remain = rem(String.to_integer(elem(x,1)), 100)
						tmp = :math.floor(String.to_integer(elem(x,1))/100)
						abso = abs(:math.floor(tmp))
						if elem(x,0) == "L" do
						
						test = abso
							
						newval = if remain>acc do (acc-remain)+100 else (acc-remain) end
						countzero = if remain > acc && acc != 0 do 1 else 0 end
						countzero = abso + countzero
						{{newval, test, countzero}, newval} 
						else 
						if elem(x,0) == "C" do
						{{String.to_integer(elem(x,1)),0,0}, String.to_integer(elem(x,1))}
						else
						test = abso
						newval = rem(acc+remain,100)
						countzero = if acc+remain > 100 do 1 else 0 end
						countzero = countzero + abso
						{{newval,test, countzero},newval}
						end
						end
					end)
IO.inspect(abc, limit: :infinity)
password = Enum.count(elem(abc,0), fn x -> elem(x,0) == 0 end)
password2 = Enum.filter(elem(abc,0), fn x -> elem(x,2) > 0 end)
password3 = Enum.reduce(password2, 0, fn {_,_,x}, acc -> acc+x end)
IO.inspect(password, limit: :infinity, printable_limit: :infinity)
IO.inspect(password3)
