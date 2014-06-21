#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    debugger;
    # @set 'deck', deck = new Deck()
    @set('deck',  deck = new Deck())
    @set('playerHand', deck.dealPlayer())
    @set('dealerHand', deck.dealDealer())


    #on flip get dealerhand
#
