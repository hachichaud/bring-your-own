angular.module '%module%.landing'
.controller 'layoutCtrl',
($scope, User) ->
  $scope.currentUser = User.getCurrent()



  $scope.logIn = (user) ->
    User.logIn(user)
    .then (_user) ->
      $scope.currentUser = _user
      $scope.showLogInForm = false

  $scope.signUp = (user) ->
    User.signUp(user)
    .then (_user) ->
      $scope.currentUser = _user
      $scope.showLogInForm = false

  $scope.openlogIn = ->
    $scope.showLogInForm = !$scope.showLogInForm
    $scope.showSignUpForm = false

  $scope.showSignUp = ->
    $scope.showLogInForm = false
    $scope.showSignUpForm = true
