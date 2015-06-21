angular.module '%module%.landing'
.config ($mdThemingProvider) ->
  $mdThemingProvider.theme 'default'
    .primaryPalette 'pink'
    .accentPalette 'orange'
    .backgroundPalette 'grey'

  $mdThemingProvider.theme 'dark-theme'
    .primaryPalette 'pink'
    .accentPalette 'orange'
    .backgroundPalette 'grey'
    .dark()
