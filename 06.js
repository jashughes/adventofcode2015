// read & parse input
const fs = require("fs");
const patt = /^(t[a-zA-Z ]+) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)$/;
const input = fs.readFileSync('06.txt', 'utf8').split("\n").map(v => v.match(patt));

// part 1
const sw = (d, v) => d === "toggle" ? Math.abs(v - 1) : d === "turn on" ? 1 : 0;
var lights = Array.from(Array(1000), () => Array(1000).fill(0));

input.forEach(e => {
  for (let x = Number(e[2]); x < Number(e[4]) + 1; x++) {
    for (let y = Number(e[3]); y < Number(e[5]) + 1; y++) {
      lights[x][y] = sw(e[1], lights[x][y]);
    }
  }
});

console.log(
  "Part 1:", 
  lights
    .map(v => v.reduce((a, b) => a + b, 0))
    .reduce((a, b) => a + b, 0)
)
