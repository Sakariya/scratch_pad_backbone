class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']
  className: 'note'

  initialize: ->
    @listenTo(@model, 'invalid', @addError)
    @listenTo(@model, 'error', @addError)
    @lastUpdated = new App.Views.LastUpdated(model: @model);

  events:
    'change': 'save'
    'keydown .note-title': 'blurIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'

  render: ->
    @$el.html(@template(note: @model))
    @lastUpdated.setElement(@$('.normal-footer')).render()
    this

  save: ->
    @model.set
      title: @$('.note-title').val()
      content: @$('.note-content').val()
    @model.save()
    false

  remove: ->
    @lastUpdated.remove(arguments...)
    super(arguments...)

  showNote: ->
    Backbone.history.navigate(@model.url(), trigger: true)
    false

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  addError: =>
    @$el.addClass('error')

  beginEditing: ->
    @$el.addClass('editing')
    @$el.removeClass('error')

  endEditing: ->
    @$el.removeClass('editing')

  destroyNote: ->
    @model.destroy()
    @remove()
    false

