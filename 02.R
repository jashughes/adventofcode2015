# read & parse input
input <- lapply(
  strsplit(readLines("02.txt", warn = FALSE), "x"),
  function(x) sort(as.numeric(x))
)

# part 1
wrap_it <- function(d) {
  2 * (d[1]*d[2] + d[2]*d[3] + d[1]*d[3]) + d[1]*d[2]
}
wrapping_needs <- sum(vapply(input, wrap_it, FUN.VALUE = numeric(1)))
print(paste0("Part 1: ", wrapping_needs))

# part 2
tie_it <- function(d) {
  2*(d[1] + d[2]) + prod(d) 
}
ribbon_needs <- sum(vapply(input, tie_it, FUN.VALUE = numeric(1)))
print(paste0("Part 2: ", ribbon_needs))
