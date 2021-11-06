// read input
const fs = require("fs");
const input = fs.readFileSync('05.txt', 'utf8').split("\n");

// part 1
const nice1 = a => a.replace(/[^aeiou]+/g, "").length >= 3;
const nice2 = a => a.match(/([a-zA-Z0-9])\1{1}/) !== null;
const nice3 = a => a.match(/ab|cd|pq|xy/) === null;

console.log(
  "Part 1:",
  input
    .filter(v => nice1(v) && nice2(v) && nice3(v))
    .length
);

// part 2
const nice4 = a => a.match(/([a-zA-Z0-9]{2}).*\1{1}/) !== null;
const nice5 = a => a.match(/([a-zA-Z0-9]).{1}\1/) !== null;

console.log(
  "Part 2:",
  input
    .filter(v => nice4(v) && nice5(v))
    .length
);