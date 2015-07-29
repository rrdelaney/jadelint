module.exports = function(grunt) {
    grunt.registerTask('doc:api', 'Generates codo documentation', function() {
        grunt.util.spawn({
            cmd: './node_modules/.bin/codo'
        }, function() {
            grunt.log.ok('Created API docs successfully!');
        });
    });
};
