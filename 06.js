// read & parse input
const fs = require("fs");
const input = fs.readFileSync('06.txt', 'utf8').split("\n");

// part 1
const sw = (d, v) => d === "toggle" ? Math.abs(v - 1) : d === "turn on" ? 1 : 0;
var lights1 = Array.from(Array(1000), () => Array(1000).fill(0));

// part 2
const knob = (d, v) => d === "toggle" ? v + 2 : d === "turn on" ? v + 1 : Math.max(0, v - 1);
var lights2 = Array.from(Array(1000), () => Array(1000).fill(0));

input.forEach(e => {
  const instr = e.match(/([a-zA-Z ]+) [0-9].*/)[1]
  const coord = [...e.matchAll(/([0-9]+)/g)].map(v => Number(v[1]))
  for (x = coord[0]; x <= coord[2]; x++) for (y = coord[1]; y <= coord[3]; y++) {
    lights1[x][y] = sw(instr, lights1[x][y]);
    lights2[x][y] = knob(instr, lights2[x][y]);
  }
});

console.log(
  "Part 1:", 
  lights1
    .map(v => v.reduce((a, b) => a + b, 0))
    .reduce((a, b) => a + b, 0)
);

console.log(
  "Part 2:", 
  lights2
    .map(v => v.reduce((a, b) => a + b, 0))
    .reduce((a, b) => a + b, 0)
);
