angular.module '%module%.event'
.controller 'NeedContributionsCtrl',
(Contribution, Need, $scope, $q) ->
  updateContributions = ->
    Need.get $scope.needId
    .then (need) ->
      promises = []
      for contribution in need.attributes.contributions
        promises.push Contribution.get contribution.id
      $q.all promises
      .then (contributions) ->
        $scope.contributions = contributions

  updateContributions()
