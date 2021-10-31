// read input
var fs = require("fs");
const input = fs.readFileSync('01.txt', 'utf8').toString().split("");

// parse input
var numbery = input.map((v) => {return v == '(' ? 1 : -1})

// part 1
console.log("Part 1: ", numbery.reduce((a, b) => a + b, 0))

// part 2
let floor_number = 0;
for (let i = 0; i < numbery.length; i++) {
  floor_number = floor_number + numbery[i];
  if (floor_number == -1) {
      console.log("Part 2:", i)
      break
  }
}
