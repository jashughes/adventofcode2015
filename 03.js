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
  houses = new Set([address(spot)]);
  dirs.forEach(v => { spot = move(spot, v); houses.add(address(spot)); })
  return houses;
}

console.log("Part 1:", delivery(dirs).size)

// part 2
function union(a, b){ 
  c = new Set(a);
  b.forEach(v => c.add(v));
  return c
}
const santa = delivery(dirs.filter((v, i) => i % 2 === 0));
const robo  = delivery(dirs.filter((v, i) => i % 2 === 1));

console.log("Part 2:", (union(santa, robo)).size)