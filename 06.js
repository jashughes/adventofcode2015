// read & parse input
const fs = require("fs");
const patt = /^(t[a-zA-Z ]+) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)$/;
const input = fs.readFileSync('06.txt', 'utf8').split("\n").map(v => v.match(patt));

// part 1
const sw = (d, v) => d === "toggle" ? Math.abs(v - 1) : d === "turn on" ? 1 : 0;
var lights1 = Array.from(Array(1000), () => Array(1000).fill(0));

// part 2
const knob = (d, v) => d === "toggle" ? v + 2 : d === "turn on" ? v + 1 : v <= 0 ? 0: v - 1;
var lights2 = Array.from(Array(1000), () => Array(1000).fill(0));

input.forEach(e => {
  for (let x = Number(e[2]); x < Number(e[4]) + 1; x++) {
    for (let y = Number(e[3]); y < Number(e[5]) + 1; y++) {
      lights1[x][y] = sw(e[1], lights1[x][y]);
      lights2[x][y] = knob(e[1], lights2[x][y]);
    }
  }
});

console.log(
  "Part 1:", 
  lights1
    .map(v => v.reduce((a, b) => a + b, 0))
    .reduce((a, b) => a + b, 0)
)

console.log(
  "Part 2:", 
  lights2
    .map(v => v.reduce((a, b) => a + b, 0))
    .reduce((a, b) => a + b, 0)
)
