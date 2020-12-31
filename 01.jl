input = [ifelse(x == "(", 1, -1) for x in split(readlines("01.txt")[1], "")]

println("Part 1: ", sum(input))
println("Part 2: ", findfirst(x -> x == -1, cumsum(input)))

#= Part 1
Santa is trying to deliver presents in a large apartment building, but he can't 
find the right floor - the directions he got are a little confusing. He starts 
on the ground floor (floor 0) and then follows the instructions one character
 at a time.

An opening parenthesis, (, means he should go up one floor, and a closing 
parenthesis, ), means he should go down one floor.

The apartment building is very tall, and the basement is very deep; he will 
never find the top or bottom floors.

To what floor do the instructions take Santa? 

-- Part 2

What is the position of the character that causes Santa to first enter the 
basement?
=#