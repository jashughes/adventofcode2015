# read & parse input
input <- readLines("04.txt", warn = FALSE)

# part 1
hash <- function(s, d) {
  digest::digest(paste0(s, d), algo = "md5", serialize = FALSE)
}
has_n_leading_zeroes <- function(x, n){
  as.numeric(regexpr("[^0]", x)) >= n + 1
}
find_first_match <- function(input, zeroes){
  n <- 0
  while (!has_n_leading_zeroes(hash(input, n), zeroes)) {
    n <- n + 1
  }
  n
}
print(paste0("Part 1: ", find_first_match(input, 5)))

# part 2
print(paste0("Part 1: ", find_first_match(input, 6)))
