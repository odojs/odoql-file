fs = require 'fs'

module.exports =
  params:
    file: (exe, params) ->
      getsource = exe.build params.__s
      getparams = exe.build params.__p
      (cb) ->
        getparams (err, params) ->
          getsource (err, source) ->
            return cb err if err?
            #timer = new Date().getTime()
            fs.readFile source, params, (err, buf) ->
              #timer = new Date().getTime() - timer
              #console.log "#{timer}ms #{source}"
              return cb err if err?
              if typeof(buf) is 'string'
                cb null, buf
              else
                cb null, buf.toString()