class window.AppView extends Backbone.View

  template: _.template(
    '<button class="hit-button">Hit</button>'+
    '<button class="stand-button">Stand</button>'+
    '<div class="player-hand-container"></div>'+
    '<div class="dealer-hand-container"></div>' )

  events:
    "click .hit-button": ->
      `debugger`
      @model.get('playerHand').hit()

    "click .stand-button": ->
      #@model.get('playerHand').stand()
      @model.get('dealerHand').at(0).flip()
      @model.get('dealerHand').hit()
      alert 'player wins' if @model.get('playerHand').scores()[0] > @model.get('dealerHand').scores()[0]
      alert 'dealer wins' if @model.get('playerHand').scores()[0] < @model.get('dealerHand').scores()[0]
      alert 'parties drew' if @model.get('playerHand').scores()[0] == @model.get('dealerHand').scores()[0]

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el



###  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '###


###[
<div>​
<button class=​"hit-button">​Hit​</button>​
<button class=​"stand-button">​Stand​</button>​
<div class=​"player-hand-container">​</div>​
<div class=​"dealer-hand-container">​</div>​
</div>​
]###

###<div class=​"hand">​
<h2>​…​</h2>​
<div class=​"card">​5 of Spades​</div>​
<div class=​"card">​Queen of Hearts​</div>​
</div>​###

