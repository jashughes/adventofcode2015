# read & parse input
input <- readLines("05.txt", warn = FALSE)

# part 1
nice1 <- function(x) nchar(gsub("[^aeiou]", "", x)) >= 3
nice2 <- function(x) grepl("([a-zA-Z0-9])\\1{1}", x)
nice3 <- function(x) !grepl("ab|cd|pq|xy", x)

# part 2
nice4 <- function(x) grepl("([a-zA-Z0-9]{2}).*\\1{1}", x, perl = TRUE)
nice5 <- function(x) grepl("([a-zA-Z0-9]).{1}\\1", x)

print(paste0(
  "Part 1: ",
  sum(
    vapply(input, function(x) nice1(x) && nice2(x) && nice3(x), logical(1))
  )
))
print(paste0(
  "Part 2: ",
  sum(
    vapply(input, function(x) nice4(x) && nice5(x), logical(1))
  )
))
