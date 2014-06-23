class window.AppView extends Backbone.View

  template: _.template(
    '<button class="hit-button">Hit</button>'+
    '<button class="stand-button">Stand</button>'+
    '<button class="reset-button">Reset</button>'+
    '<div class="player-hand-container"></div>'+ 
    '<div class="results-container"></div>'+
    '<div class="dealer-hand-container"></div>' )

  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()

    "click .stand-button": ->
      @model.get('playerHand').stand()

    "click .reset-button": ->
      @model.newGame()

  initialize: ->
    @render()

    @model.on 'win', -> 
      @$('.results-container').html 'Player Wins!'
    , @
    
    @model.on 'lose', -> 
      @$('.results-container').html 'Dealer Wins!'
    , @
    
    @model.on 'draw', -> 
      @$('.results-container').html 'It\'s a draw!'
    , @

    @model.on 'newGame', @render

  
  render: =>
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  # updateGameStatus: (event) ->
  #   switch event
  #     when 'win:player' then alert 'Player Wins!'
  #     when 'win:dealer' then alert 'Dealer Wins!'
  #     when 'win:draw' then alert 'Game draws!'


