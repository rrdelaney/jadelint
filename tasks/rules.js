module.exports = function(grunt) {
    grunt.registerTask('doc:rules', 'Creates documentation for jadelint', function() {
        var rules = require('./../rules').rules;
        var docOutput = '';

        for (var rule in rules) {
            var props = new rules[rule];

            docOutput += '### ' + rule + '\n' +
                         '_' + props.name + '_\n\n' +
                         '__default__: ' + props.level + '\n' +
                         '\n' +
                         props.description +
                         '\n\n';
        }

        grunt.file.write('docs/rules.md', docOutput);
        grunt.log.ok('docs/rules.md created successfully!');
    });
};
