angular.module '%module%.event'
.controller 'shareEventCtrl',
($scope, $stateParams, User, Need, event) ->
  $scope.event = event
  currentUser = User.getCurrent()
  tempQuantity = 2
  $scope.getCompletion = (quantity, expected) ->
    return 0 unless quantity > 0 and expected > 0
    return (quantity / expected) * 100

  $scope.submitQuantity = (need) ->
    Need.submitQuantity need, tempQuantity, currentUser
    .then -> $scope.$apply()

  $scope.seeDetails = (need, index) ->
    Need.get need.id, true
    .then (_need) ->
      $scope.highlightedNeed = _need
      $scope.$apply()

  $scope.removeQuantity = (need) ->
    Need.removeQuantity need, tempQuantity, currentUser
    .then -> $scope.$apply()
