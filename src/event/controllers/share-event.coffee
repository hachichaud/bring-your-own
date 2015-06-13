angular.module '%module%.event'
.controller 'shareEventCtrl',
($scope, $stateParams, User, Need, event) ->
  $scope.event = event
  currentUser = User.getCurrent()
  $scope.getCompletion = (quantity, expected) ->
    return 0 unless quantity > 0 and expected > 0
    return (quantity / expected) * 100

  $scope.submitQuantity = (need) ->
    Need.submitQuantity need, 2, currentUser
