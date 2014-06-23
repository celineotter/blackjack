class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    debugger
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    
    @$el.html '<img src="img/card-back.png">' if !@model.get('revealed')

