var path = require('path');
var coffeeCoverage = require('coffee-coverage');
var projectRoot = __dirname;
var coverageVar = coffeeCoverage.findIstanbulVariable();
var writeOnExit = (coverageVar == null) ? (projectRoot + '/coverage/coverage-coffee.json') : null;

coffeeCoverage.register({
    instrumentor: 'istanbul',
    basePath: projectRoot,
    exclude: ['/test', '/node_modules', '/.git', 'Gruntfile.coffee', '/bin', '/src/jadelint'],
    coverageVar: coverageVar,
    writeOnExit: writeOnExit,
    initAll: true
});
