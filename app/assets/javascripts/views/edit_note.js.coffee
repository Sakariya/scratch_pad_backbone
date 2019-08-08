class App.Views.EditNote extends Backbone.View
  template: JST['notes/edit']

  tagName: 'form'

  events:
    'submit': 'saveModel'

  render: ->
    @$el.html(@template(note: @model))
    this

  saveModel: (e) ->
    @model.title = @$('.note-title').val()
    @model.content = @$('.note-content').val()
    Backbone.history.navigate('/', trigger: true)
    false

