angular.module '%module%.event'
.factory 'Contribution', ->
  ParseContribution = Parse.Object.extend 'Contribution'

  create = (user, need, quantity=0) ->
    contribution = new ParseContribution
      user: user
      quantity: quantity
      need: need
    contribution

  get = (id) ->
    query = new Parse.Query(ParseContribution)
    query.include 'user'
    query.get id
    .then (contribution) ->
      return if contribution.results or !contribution
      return contribution

  get: get
  create: create
  ParseContribution: ParseContribution
