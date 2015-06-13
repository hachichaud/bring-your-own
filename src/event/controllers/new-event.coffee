angular.module '%module%.event'
.controller 'newEventCtrl',
($scope, User, Event, Need) ->
  $scope.event ?=
    name: 'yolo'
    host: User.getCurrent()
    needs: []

  $scope.addStuff = ->
    need = Need.create()
    need.set 'quantity', 0
    need.set 'bringers', []
    $scope.event.needs.push Need.create()

  $scope.create = ->
    Event.create $scope.event
    .then (_event) ->
      $scope.event.createdAt = _event.createdAt
      $scope.event.id = _event.id
      $scope.$apply()

  $scope.update = ->
    Event.update $scope.event
    .then (_event) ->
      $scope.event.createdAt = _event.createdAt
      $scope.event.id = _event.id
      $scope.event.updatedAt = _event.updatedAt
      $scope.$apply()
