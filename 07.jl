input = readlines("07.txt")

# bit operation functions

function bitNOT(x)
    parse(Int, bitstring(~UInt16(x)); base = 2)
end

function bitAND(x, y)
    parse(Int, bitstring(UInt16(x) & UInt16(y)); base = 2)
end

function bitOR(x, y)
    parse(Int, bitstring(UInt16(x) | UInt16(y)); base = 2)
end

function bitSHIFTL(x, n)
    parse(Int, bitstring(UInt16(x) << n); base = 2)
end

function bitSHIFTR(x, n)
    parse(Int, bitstring(UInt16(x) >>> n); base = 2)
end

# parse instructions

function wire(str, wn, w)
    occursin(r"AND", str) && return bitAND(wn[1], wn[2])
    occursin(r"OR", str) && return bitOR(wn[1], wn[2])
    occursin(r"NOT", str) && return bitNOT(wn[1])
    occursin(r"LSHIFT", str) && return bitSHIFTL(wn[1], wn[2])
    occursin(r"RSHIFT", str) && return bitSHIFTR(wn[1], wn[2])
    wn[1]
end

function wire_needs(str)
    [str[f] for f in findall(r"([0-9a-z]+)", str)]
end

function sub_wires(wi, w)
    if wi in keys(w) 
        w[wi]
    else 
        parse(Int, wi)
    end
end

function detangle(d)
    w = Dict()
    while length(d) > 0
        for (k, v) in d
            wn = wire_needs(v)
            if all(a in keys(w) || tryparse(Int, a) isa Number for a in wn)
                wn = [sub_wires(wi, w) for wi in wn] 
                w[k] = wire(v, wn, w)
                delete!(d, k)
            end
        end
    end
    w
end

# part 1
d = Dict(i[2] => i[1] for i in split.(input, " -> ")) 
w = detangle(d)
println("Part 1: ", w["a"])

# part 2
d = Dict(i[2] => i[1] for i in split.(input, " -> ")) 
d["b"] = string(w["a"])
w = detangle(d)
println("Part 2: ", w["a"])

