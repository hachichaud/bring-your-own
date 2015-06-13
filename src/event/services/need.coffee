angular.module '%module%.event'
.factory 'Need', ->
  ParseNeed = Parse.Object.extend 'Need'

  create = () ->
    new ParseNeed()

  submitQuantity = (need, quantity, user) ->
    if need.attributes.quantity
      need.increment 'quantity', quantity
    else
      need.set 'quantity', quantity
    if need.attributes.bringers
      need.addUnique 'bringers', user
    else
      bringers = [
        user
      ]
      need.set 'bringers',bringers
    need.save()
    # unless need.bringers and _.
  # get = (needId) ->
  #   return unless needId
  #   query = new Parse.Query(ParseNeed)
  #   query.get needId
  #   .then (need) ->
  #     if need.results or !need
  #       return
  #     else
  #       return need

  create: create
  submitQuantity: submitQuantity
