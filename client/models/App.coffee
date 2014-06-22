#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    # @set 'deck', deck = new Deck()
    @set('deck',  deck = new Deck())
    @set('playerHand', deck.dealPlayer())
    @set('dealerHand', deck.dealDealer())

    @get('playerHand').on 'bust', -> @trigger 'win: dealer'
    @get('playerHand').on 'stand', =>
      `debugger`
      @get('dealerHand').playWin()

    @get('dealerHand').on 'bust', -> @trigger 'win: player'

    # @get('dealerHand').on 'stand', =>
    #   `debugger`
    #   pScore = @get('playerHand').scores()[0]
    #   dScore = @get('dealerHand').scores()[0]

    @get('dealerHand').on 'stand', =>
      `debugger`
      pScore = @get('playerHand').scores()[0]
      dScore = @get('dealerHand').scores()[0]
      alert ( if pScore is dScore then 'Game is a draw' else if pScore > dScore then 'You Win' else 'Dealer Wins' )
      #@gameEval()

  # gameEval: ->
  #   `debugger`
  #   pScore = @get('playerHand').scores()[0]
  #   dScore = @get('dealerHand').scores()[0]
  #   alert ( if pScore is dScore then 'Game is a draw' else if pScore > dScore then 'You Win' else 'Dealer Wins' )
