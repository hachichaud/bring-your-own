angular.module '%module%.event'
.controller 'shareEventCtrl',
($scope, $stateParams, User, Need, event) ->
  $scope.event = event
  currentUser = User.getCurrent()
  $scope.needQuantityInputs = Array.apply(null, Array(event.needs.length)).map(Number.prototype.valueOf,0)
  $scope.getCompletion = (quantity, expected) ->
    return 0 unless quantity > 0 and expected > 0
    return (quantity / expected) * 100

  $scope.submitQuantity = (need, quantity) ->
    Need.submitQuantity need, quantity, currentUser
    .then -> $scope.$apply()

  $scope.seeDetails = (need, index) ->
    Need.get need.id, true
    .then (_need) ->
      $scope.highlightedNeed = _need
      $scope.$apply()

  $scope.removeQuantity = (need, quantity) ->
    Need.removeQuantity need, quantity, currentUser
    .then -> $scope.$apply()
