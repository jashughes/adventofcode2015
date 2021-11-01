// read input
var fs = require("fs");
const input = fs.readFileSync('02.txt', 'utf8').toString().split("\n")
const dims = input.map(v => v.split("x").map((v) => Number(v)))

// part 1
function calc_leeway(d){
    d.sort(function(a, b){return a - b});
    return d[0] * d[1];
}

function calc_main(d){
    return 2*(d[0]*d[1] + d[1]*d[2] + d[2]*d[0])
}

function wrap_needs(d){
    return calc_main(d) + calc_leeway(d)
}

// part 2
function calc_bow(d){
    return d.reduce((a, b) => a * b)
}

function calc_around(d){
    d.sort(function(a, b){return a - b});
    return 2 * d[0] + 2 * d[1]
}

function ribbon_needs(d){
    return calc_bow(d) + calc_around(d)
}

var area = dims.map(v => wrap_needs(v)).reduce((a, b) => a + b);
var ribbon = dims.map(v => ribbon_needs(v)).reduce((a, b) => a + b);
console.log("Part 1:", area);
console.log("Part 2:", ribbon)