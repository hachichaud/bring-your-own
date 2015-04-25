angular.module '%module%.landing'
.config ($translateProvider) ->
  $translateProvider.translations 'en',
    HOME_TITLE: 'Bring Your Own'
    HOME_TEXT: 'Creating events for lazy people since 2015'

  $translateProvider.translations 'fr',
    HOME_TITLE: 'Bring Your Own'
    HOME_TEXT: 'Ne viens pas les mains vides'
