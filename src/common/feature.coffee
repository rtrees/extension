class Trees.Feature
  constructor: (options = {}) ->
    @options = _.extend({}, options)
    @initialize()
    if @onDOMReady?
      @watchDomReady => @onDOMReady()

  initialize: ->
    # noop

  watchDomReady: (fn) ->
    done = false
    top = true
    win = window
    doc = win.document
    root = doc.documentElement
    add = if doc.addEventListener then "addEventListener" else "attachEvent"
    rem = if doc.addEventListener then "removeEventListener" else "detachEvent"
    pre = if doc.addEventListener then "" else "on"

    init = (e) ->
      if e.type == "readystatechange" && doc.readyState != "complete" then return
      (if e.type == "load" then win else doc)[rem](pre + e.type, init, false)
      if !done && (done = true) then fn()
    
    poll = ->
      try
        root.doScroll "left"
      catch e
        setTimeout poll, 50
        return

      init "poll"

    if doc.readyState == "complete"
      fn()
    else
      if doc.createEventObject && root.doScroll
        try
          top = !win.frameElement
        catch e

        if top
          poll()

      doc[add](pre + "DOMContentLoaded", init, false)
      doc[add](pre + "readystatechange", init, false)
      win[add](pre + "load", init, false)

  $: ->
    window.document.querySelector.apply(window.document, arguments)

  $$: ->
    window.document.querySelectorAll.apply(window.document, arguments)