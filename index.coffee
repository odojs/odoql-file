fs = require 'fs'

module.exports = (exe, params) ->
  getpath = exe.build params.__path
  getparams = exe.build params.__params
  (cb) ->
    getparams (err, params) ->
      getpath (err, path) ->
        return cb err if err?
        fs.readFile path, params, (err, buf) ->
          return cb err if err?
          if typeof(buf) is 'string'
            cb null, buf
          else
            cb null, buf.toString()