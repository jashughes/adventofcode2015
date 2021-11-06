# read & parse input
mapping <- list(
  "v" = c( 0, -1),
  "^" = c( 0,  1),
  ">" = c( 1,  0),
  "<" = c(-1,  0)
)
input <- vapply(
  strsplit(readLines("03.txt", warn = FALSE), "")[[1]],
  function(x) mapping[[x]],
  numeric(2)
)

# part 1
addresses <- rbind(
  c(0, 0), # starting point
  apply(input, 1L, cumsum)
)
print(paste0("Part 1: ", nrow(unique(addresses))))

# part 2
addresses <- rbind(
  c(0, 0), # starting point
  apply(input[,c(TRUE, FALSE)], 1L, cumsum),
  apply(input[,c(FALSE, TRUE)], 1L, cumsum)
)
print(paste0("Part 2: ", nrow(unique(addresses))))