var jadelint = require('./../target/jadelint.js');
var exitCode = jadelint(process.argv.slice(2, process.argv.length));
