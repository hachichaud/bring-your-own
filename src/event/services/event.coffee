angular.module '%module%.event'
.factory 'Event', ($q) ->
  ParseEvent = Parse.Object.extend 'Event'

  createOrUpdate = (event) ->
    return unless event
    parseEvent = new ParseEvent()
    parseEvent.save event

  get = (eventId) ->
    return unless eventId
    query = new Parse.Query(ParseEvent)
    query.include 'needs'
    query.include 'host'
    query.get eventId
    .then (event) ->
      if event.results or !event
        return
      else
        return event

  create: createOrUpdate
  update: createOrUpdate
  get: get
