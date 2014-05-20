path = require 'path'
temp = require 'temp'
http = require 'http'
url  = require 'url'

module.exports = (pkg, callback) ->
  app = this

  if app.argv.config?
    parseConfig.call app, app.argv.config,  (pkgContextList) ->
      for pkgContext in pkgContextList
        execInstall pkgContext
      callback null

  base_url = app.prompt.get 'url', (err, result) ->
    if err then callback(err)
    base_url = result.url
    if app.argv.artifact?
      pkg = new Package(app, app.argv.artifact, base_url)
      pkg.install callback
    else
      app.prompt.get 'name', (err, result) ->
        if err then return callback(err)
        name = result.name
        app.prompt.get 'id', (err, result) ->
          if err then return callback(err)
          id = result.id
          app.log.info "installing #{name}-#{id}..."
          callback null

parseConfig = (configPath, callback) ->
  resolvedPath = path.resolve __dirname, configPath

class Package
  constructor: (@app, @artifactID, baseUrl) ->
    @pkg_url = url.resolve baseUrl, @artifactID
  install: (callback) ->
    @app.log.info "downloading '#{@artifactID}' from '#{@pkg_url}'"
    temp.track()
    stream = temp.createWriteStream()
    req = http.get @pkg_url, (response) ->
      response.pipe stream
      response.on 'end', callback
      response.on 'error', (err) ->
        callback(err)
    self = this
    req.on 'error', (err) ->
      console.dir(err)
      if err && err.code == 'ENOTFOUND'
        callback new Error "artifact not found at '#{self.pkg_url}'"
      else
        callback new Error "something went wrong while downloading '#{self.pkg_url}'"
    console.dir stream
