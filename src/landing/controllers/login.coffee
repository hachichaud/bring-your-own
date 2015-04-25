angular.module '%module%.landing'
.controller 'loginCtrl',
($scope, User) ->
  $scope.logIn = (user) ->
    User.logIn user
