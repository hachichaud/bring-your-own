angular.module '%module%.event'
.directive 'needContributions', ->
  restrict: 'AE'
  scope:
    needId: '='
  controller: 'NeedContributionsCtrl'
  templateUrl: 'event/directives/need-contributions/view.html'
