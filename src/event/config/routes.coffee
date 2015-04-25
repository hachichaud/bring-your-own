angular.module '%module%.landing'
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
