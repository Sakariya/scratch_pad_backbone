window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllNotes = new @Collections.Notes(@notesJson, parse: true)
    view = new @Views.Notes(collection: @AllNotes)
    $('#container').html(view.render().el)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
