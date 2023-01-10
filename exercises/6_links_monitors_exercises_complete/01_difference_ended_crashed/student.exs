IO.inspect(self()) #PID<0.104.0>
p1 = spawn_link(fn ->
  Process.sleep(5000)
  exit(:normal)
 end) #PID<0.107.0>

Process.alive?(p1) #true
# After 5 seconds...
Process.alive?(p1) #false


IO.inspect(self()) #PID<0.104.0>

# spawn_link(fn -> raise "oopsie" end)

# ** (EXIT from #PID<0.104.0>) shell process exited with reason: an exception was raised:
#     ** (RuntimeError) oopsie
#         iex:5: (file)

IO.inspect(self()) #PID<0.112.0>
