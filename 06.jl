input = readlines("06.txt")

function light_switch(instr, v)
  instr == "turn on" && return 1
  instr == "turn off" && return 0
  abs(v - 1)
end

function dimmer(instr, v)
  instr == "turn on" && return v + 1
  instr == "turn off" && return max(0, v - 1)
  v + 2
end

function light_loop(input, f)
  lights = zeros(Int, 1000, 1000)
  for i in input
    instr = replace(i, r" \d.*" => "")
    v = [parse(Int, i[f]) for f in findall(r"([0-9]+)", i)]
    for x = v[1]:v[3], y = v[2]:v[4]
      lights[x, y] = f(instr, lights[x, y])
    end 
  end
  lights
end

println("Part 1: ", sum(light_loop(input, light_switch)))
println("Part 2: ", sum(light_loop(input, dimmer)))