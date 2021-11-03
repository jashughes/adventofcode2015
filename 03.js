// read input
const fs = require("fs");
const input = fs.readFileSync('03.txt', 'utf8').toString().split("");

// parse input  to x-y coordinates
const coord_keys = {
  'v': [0, -1],
  '^': [0, 1],
  '>': [1, 0],
  '<': [-1, 0]
};
let dirs = input.map(v => coord_keys[v]);


// part 1
const move = (start, d) => [start[0] + d[0], start[1] + d[1]];
const address = (d) => d[0] + ',' + d[1];

function delivery(dirs) {
  spot = [0, 0];
  houses = new Set();
  for (let i = 0; i < dirs.length; i++) {
    houses.add(address(spot));
    spot = move(spot, dirs[i]);
  }
  houses.add(address(spot));
  return houses;
}

console.log("Part 1:", delivery(dirs).size)
