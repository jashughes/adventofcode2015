// read and parse input
var fs = require("fs");
const input = fs.readFileSync('02.txt', 'utf8').toString().split("\n");
const low2high = (a, b) => a - b;
const sum = (a, b) => a + b;
const sorted = input.map(v => v.split("x")).map((v) => v.sort(low2high));


// part 1

var area = sorted.map(([a, b, c]) => 2 * (a*b + b*c + a*c) + a * b).reduce(sum)
console.log("Part 1:", area);

// part 2
var ribbon = sorted.map(([a, b, c]) => a * b * c + 2 * a + 2 * b).reduce(sum)
console.log("Part 2:", ribbon)
