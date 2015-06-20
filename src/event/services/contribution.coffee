angular.module '%module%.event'
.factory 'Contribution', ->
  ParseContribution = Parse.Object.extend 'Contribution'

  create = (user, need, quantity=0) ->
    contribution = new ParseContribution
      user: user
      quantity: quantity
      need: need
    contribution

  create: create
  ParseContribution: ParseContribution
