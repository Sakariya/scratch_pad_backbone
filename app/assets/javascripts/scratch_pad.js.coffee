window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllNotes = [
      { id: 1, title: 'make a second todo item', complete: true },
      { id: 2, title: 'Make another todo list', complete: false },
      { id: 3, title: 'DSICO PARTY!', complete: false }
    ]
    new @Routers.ScratchPadRouter
    Backbone.history.start(pushState: true)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
