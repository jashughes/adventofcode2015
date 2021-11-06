// read input
const fs = require("fs");
const MD5 = require("crypto-js/md5");
const input = fs.readFileSync('04.txt', 'utf8').toString();

// part 1
const hash = (a, b) => MD5(a + b).toString();
const startswith5zeroes = (a) => a.search("[^0]") >= 5;

let n = 0;
while (!startswith5zeroes(hash(input, n))) {
  n++;
}
console.log("Part 1:", n)

// part 2
const startswith6zeroes = (a) => a.search("[^0]") >= 6;

let m = 0;
while (!startswith6zeroes(hash(input, m))) {
  m++;
}
console.log("Part 2:", m)