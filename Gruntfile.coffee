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

        codo:
            api:
                expand: true
                src: '<%= src_dir %>'
                dest: 'docs/api'
                options:
                    name: 'jadelint'
                    title: 'API'

        clean:
            dist: ['<%= target_dir %>']

    grunt.loadTasks 'tasks/'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-codo'

    grunt.registerTask 'dist', ['clean:dist', 'coffeelint:dist', 'coffee:dist']
    grunt.registerTask 'doc', ['doc:rules', 'codo']

    grunt.registerTask 'default', ['dist', 'doc']

    return
