// read input
const fs = require("fs");
const MD5 = require("crypto-js/md5");
const input = fs.readFileSync('04.txt', 'utf8').toString();

// part 1
const hash = (a, b) => MD5(a + b).toString();
const startswithNzeroes = (a, b) => a.search("[^0]") >= b;

let n = 0;
while (!startswithNzeroes(hash(input, n), 5)) {
  n++;
}
console.log("Part 1:", n)

// part 2
let m = 0;
while (!startswithNzeroes(hash(input, m), 6)) {
  m++;
}
console.log("Part 2:", m)