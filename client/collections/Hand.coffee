class window.Hand extends Backbone.Collection

  model: Card

  allowedToHit: true

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    # if (@isDealer)
    #   while(@scores()[0] < 17)
    #     @add(@deck.pop()).last()
    #@trigger 'playerStand'
      return if @scores()[0] >= 21  # Cheap disable button effect.
      @add(@deck.pop()) # @add(@deck.pop()).last()

      #@trigger 'win' if (@scores()[0] == 21)

      @trigger 'bust' if @busted()
      #alert "Bust!" if @scores()[0] > 21
      #alert "Blackjack!" if @scores()[0] is 21

  stand: ->   #change hands
    @trigger 'stand'

  busted: ->
    @scores()[0] > 21

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false

    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0

    if hasAce then [score, score + 10] else [score]


  playWin: ->
    @first().flip()
    @hit() while @scores()[0] < 17
    @stand()
