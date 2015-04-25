angular.module '%module%.landing'
.controller 'landingCtrl',
($scope, User) ->
  $scope.currentUser = User.getCurrent()
  $scope.logOut = -> User.logOut()
