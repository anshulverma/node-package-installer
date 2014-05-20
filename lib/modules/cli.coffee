flatiron = require 'flatiron'
path     = require 'path'
optimist = require 'optimist'

app = module.exports = flatiron.app

require('pkginfo')(module, 'name', 'version')

app.use(
  flatiron.plugins.cli,
  {
    usage: require('./usage')
    version: true
    argv:
      name:
        description: 'Name of the package to install'
        alias: 'n'
        string: true
      id:
        description: 'Version ID of the package to install'
        alias: 'i'
        string: true
      config:
        description: 'Path of the json config file which lists packages to be installed'
        alias: 'c'
        string: 'true'
      artifact:
        description: 'Artifact ID of the package to be installed'
        alias: 'a'
        string: 'true'
      url:
        description: 'URL to download packages from'
        alias: 'u'
        string: 'true'
      dest:
        description: 'Destination directory to install your package'
        alias: 'd'
        string: 'true'
        default: '/usr/lib'
      help:
        description: 'print this help information'
        alias: 'h'
      version:
        description: 'prints version of npi that you are running'
        alias: 'v'
    dir: path.join(__dirname, 'commands')
    prompt:
      message: 'npi> '
      delimiter: ' '
      override: true
      properties:
        name:
          description: 'package name: '
          type: 'string'
          pattern: /[^\s]+$/
          message: 'Package name must not be empty'
          hidden: false
        id:
          description: 'package version ID: '
          type: 'string'
          pattern: /[^\s]+$/
          message: 'Version ID cannot be empty'
          hidden: false
        url:
          description: 'url: '
          type: 'string'
          pattern: /[^\s]+$/
          message: 'URL cannot be empty'
          hidden: false
  })

app.ready = false;

app.start = (callback) ->
  app.init (err) ->
    app.welcome()
    if err?
      app.showError app.argv._.join ' ', err
      return callback(err)
    minor = process.version.split('.')[1];

    if parseInt(minor, 10) % 2
      app.log.warn 'You are using unstable version of node.js. You may experience problems.'

    return app.exec app.argv._, callback

app.exec = (command, callback) ->
  execCommand = (err) ->
    if err then return callback(err)
    fullCommand = command.join ' '
    if fullCommand then app.log.info 'Executing command ' + fullCommand.magenta
    app.router.dispatch 'on', fullCommand, app.log, (err, shallow) ->
      callback err
  try
    return if app.ready then execCommand() else app.setup(execCommand)
  catch e
    callback e
    app.showError command.join(' '), e


app.setup = (callback) ->
  if app.ready is true
    return callback()
  app.ready = true;
  callback()

app.welcome = () ->
  app.log.info 'Welcome to ' + 'NPI'.grey + ' utility'
