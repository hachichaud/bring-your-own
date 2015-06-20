angular.module '%module%.event'
.factory 'Need', (Contribution) ->
  ParseNeed = Parse.Object.extend 'Need'

  create = () ->
    new ParseNeed()

  get = (need, fetchContributions=false) ->
    query = new Parse.Query(ParseNeed)
    query.get need.id
    .then (need) ->
      if need.results or !need
        return
      else
        if fetchContributions
          getNeedContributions need
        else
          return need

  getNeedContributions = (need) ->
    query = new Parse.Query(Contribution.ParseContribution)
    query.equalTo 'need', need
    query.include 'user'
    query.find()

  getUserContribution = (need, user) ->
    query = new Parse.Query(Contribution.ParseContribution)
    query.equalTo 'need', need
    query.equalTo 'user', user
    query.include 'user'
    query.find()

  submitQuantity = (need, quantity, user) ->
    need.increment 'quantity', quantity
    need.save()
    getUserContribution need, user
    .then (contributions) ->
      if contributions.length > 0
        contributions[0].increment 'quantity', quantity
        contributions[0].save()
      else
        contribution = Contribution.create user, need, quantity
        contribution.save()
        .then ->
          need.add 'contributions', contribution
          need.save()

  removeQuantity = (need, quantity, user) ->
    getUserContribution need, user
    .then (contributions) ->
      if contributions.length > 0
        prevQuantity = contributions[0].get('quantity')#5
        newQuantity = Math.max 0, prevQuantity - quantity#3
        contributions[0].set 'quantity', newQuantity#3
        contributions[0].save()
        need.increment 'quantity', newQuantity - prevQuantity
        need.save()
        return

  removeQuantity: removeQuantity
  create: create
  submitQuantity: submitQuantity
  get: get
