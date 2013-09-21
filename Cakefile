Build = require './build/build.coffee'

option '', '--warn [WARN]', 'Show warning countdowns.'

task 'build:chrome', (options) ->
  build = new Build(options)
  build.chrome()