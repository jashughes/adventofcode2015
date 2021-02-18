using MD5
input = read("04.txt", String)

function hash_it(input, num)
    bytes2hex(md5(string(input, num)))
end

function has_n_leading(str, n)
    occursin(Regex("^(0){$n}"), str)
end

function mine_coin(input, n)
    i = 0
    while true
        i += 1
        if has_n_leading(hash_it(input, i), n)
            break
        end
    end
    i
end

println("Part 1: ", mine_coin(input, 5))
println("Part 2: ", mine_coin(input, 6))

#=--- Day 4: The Ideal Stocking Stuffer ---

Santa needs help mining some AdventCoins (very similar to bitcoins) 
to use as gifts for all the economically forward-thinking little 
girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start 
with at least five zeroes. The input to the MD5 hash is some secret 
key (your puzzle input, given below) followed by a number in decimal. 
To mine AdventCoins, you must find Santa the lowest positive number 
(no leading zeroes: 1, 2, 3, ...) that produces such a hash.

For example:

    If your secret key is abcdef, the answer is 609043, because the
     MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), 
     and it is the lowest such number to do so.
    If your secret key is pqrstuv, the lowest number it combines with 
     to make an MD5 hash starting with five zeroes is 1048970; that is, 
     the MD5 hash of pqrstuv1048970 looks like 000006136ef....

--- Part Two ---

Now find one that starts with six zeroes.

=#