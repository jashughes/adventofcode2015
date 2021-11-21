# read & parse input
input <- readLines("06.txt", warn = FALSE)

lights1 <- matrix(0, nrow = 1000, ncol = 1000)
lights2 <- matrix(0, nrow = 1000, ncol = 1000)

coords <- function(str) {
  m <- gregexpr("([0-9]+)", str)[[1]]
  as.numeric(substring(str, m, m + attr(m, "match.length") - 1))
}

for (i in input) {
  d <- coords(i)
  instr <- gsub("([a-zA-Z]) [0-9]+.*", "\\1", i)
  idx <- expand.grid(d[1]:d[3], d[2]:d[4])
  m <- cbind(idx[, 1], idx[, 2])
  # part 1
  if (instr == "toggle") {
    lights1[m] <- abs(lights1[m] - 1)
    lights2[m] <- lights2[m] + 2
  } else if (instr == "turn on") {
    lights1[m] <- 1
    lights2[m] <- lights2[m] + 1
  } else {
    lights1[m] <- 0
    lights2[m] <- pmax(lights2[m] - 1, 0)
  }
}

print(paste0("Part 1: ", sum(lights1)))
print(paste0("Part 2: ", sum(lights2)))
