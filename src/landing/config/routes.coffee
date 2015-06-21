angular.module '%module%.landing'
.config ($stateProvider) ->
  $stateProvider
  .state 'landing',
    url: '/'
    templateUrl: 'landing/views/view.html'
    controller: 'landingCtrl'
  .state 'landing.signup',
    url: 'signup'
    templateUrl: 'landing/views/signup.html'
    controller: 'signupCtrl'
  .state 'landing.login',
    url: 'login'
    templateUrl: 'landing/views/login.html'
    controller: 'loginCtrl'
  .state 'layout',
    url: '/layout'
    templateUrl: 'landing/views/layout.html'
    controller: 'layoutCtrl'
