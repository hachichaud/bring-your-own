angular.module '%module%.event'
.config ($stateProvider) ->
  $stateProvider
  .state 'event',
    url: '/event'
    abstract: true
    template: '<ui-view></ui-view>'
  .state 'event.new',
    url: '/new'
    templateUrl: 'event/views/new.html'
    controller: 'newEventCtrl'
  .state 'event.share',
    url: '/share/:eventId'
    templateUrl: 'event/views/share.html'
    resolve:
      event: ($stateParams, Event) ->
        Event.get $stateParams.eventId, true
        .then (eventObject) ->
          eventObject?.attributes

    controller: 'shareEventCtrl'
