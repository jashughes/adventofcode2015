# read & parse input
input <- readLines("06.txt", warn = FALSE)

lights1 <- matrix(0, nrow = 1000, ncol = 1000)
lights2 <- matrix(0, nrow = 1000, ncol = 1000)

light_switch <- function(v, instr) {
  ifelse(
    instr == "toggle", 
    abs(v - 1),
    ifelse(instr == "turn on", 1, 0)
  )
}
dimmer <- function(v, instr) {
  ifelse(
    instr == "toggle", 
    v + 2,
    ifelse(
      instr == "turn on", 
      v + 1, 
      ifelse(v <= 0, 0, v - 1))
  )
}

coords <- function(str) {
  m <- gregexpr("([0-9]+)", str)[[1]]
  as.numeric(substring(str, m, m + attr(m, "match.length") - 1))
}

for (i in input) {
  d <- coords(i)
  instr <- gsub("([a-zA-Z]) [0-9]+.*", "\\1", i)
  # part 1
  lights1[d[1]:d[3], d[2]:d[4]] <- apply(
    lights1[d[1]:d[3], d[2]:d[4], drop = FALSE], 
    c(1, 2), 
    light_switch, 
    instr
  )
  # part 2
  lights2[d[1]:d[3], d[2]:d[4]] <- apply(
    lights2[d[1]:d[3], d[2]:d[4], drop = FALSE], 
    c(1, 2), 
    dimmer, 
    instr
  )
}

print(paste0("Part 1: ", sum(lights1)))
print(paste0("Part 2: ", sum(lights2)))
