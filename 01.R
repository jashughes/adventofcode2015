# read & parse input
input <- strsplit(readLines("01.txt", warn = FALSE), "")[[1]]
numbery <- ifelse(input == "(", 1, -1)

# part 1
print(paste0("Part 1: ", sum(numbery)))

# part 2
print(paste0("Part 2: ", which(cumsum(numbery) == -1)[1]))
