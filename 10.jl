input = parse.(Int, split(readlines("10.txt")[1], ""))

function looksay(look)
    say = []
    if length(look) == 1
        return [1, look[1]]
    end

    c = 1
    l = look[1]
    
    for i in 2:length(look)
        if l == look[i]
            c += 1
        else
            push!(say, c)
            push!(say, l)
            c = 1
            l = look[i]
        end
    end
    push!(say, c)
    push!(say, l)
    say
end

function looplooksay(input, N)
    say = input
    for n = 1:N
        say = looksay(say)
    end
    length(say)
end

println("Part 1: ", looplooksay(input, 40))
println("Part 2: ", looplooksay(input, 50))