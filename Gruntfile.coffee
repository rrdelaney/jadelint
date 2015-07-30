module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        src_dir: 'src'
        target_dir: 'target'

        coffee:
            dist:
                expand: true
                cwd: '<%= src_dir %>'
                src: ['**/*.coffee']
                dest: '<%= target_dir %>'
                ext: '.js'
                options:
                    bare: yes

        coffeelint:
            dist: ['<%= src_dir %>/**/*.coffee']
            options:
                max_line_length:
                    level: 'ignore'
                indentation:
                    value: 4

        clean:
            dist: ['<%= target_dir %>']

    grunt.loadTasks 'tasks/'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'dist', ['clean:dist', 'coffeelint:dist', 'coffee:dist']
    grunt.registerTask 'doc', ['doc:rules', 'doc:api']

    grunt.registerTask 'default', ['dist', 'doc']

    return
