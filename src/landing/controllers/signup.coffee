angular.module '%module%.landing'
.controller 'signupCtrl',
($scope, User) ->
  $scope.signUp = (user) ->
    User.signUp user
