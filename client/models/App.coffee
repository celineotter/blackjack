#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @newGame()

  assessScores: (status) =>
    @trigger 'lose' if status is 'lose'
    @trigger 'win' if status is 'win'
    @trigger 'draw' if status is 'draw'

  newGame: ->
    @set('deck',  deck = new Deck())
    @set('playerHand', deck.dealPlayer())
    @set('dealerHand', deck.dealDealer())

    @get('playerHand').on 'bust', =>
      @trigger 'lose'
      #@assessScores('lose')
    
    @get('playerHand').on 'stand', =>
      @get('dealerHand').playWin()
    
    @get('dealerHand').on 'bust', =>
      #@trigger 'win', @
      @assessScores('win')

    @trigger 'newGame'


    @get('dealerHand').on 'stand', =>
      pScore = @get('playerHand').scores()[0]
      dScore = @get('dealerHand').scores()[0]
      if pScore is dScore then @assessScores('draw')
      else if pScore > dScore then @assessScores('win')
      else @assessScores('lose')