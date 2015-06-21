angular.module '%module%.user'
.factory 'User', ($q) ->
  signUp = (user) ->
    return unless user and user.username and user.password and user.email
    parseUser = new Parse.User
    parseUser.set 'username', user.username
    parseUser.set 'password', user.password
    parseUser.set 'email', user.email
    deferred = $q.defer()
    parseUser.signUp null,
      success: (_user) ->
        # Hooray! Let them use the app now.
        deferred.resolve _user
        return _user
      error: (_user, error) ->
        deferred.reject error
        return error
    return deferred.promise

  logIn = (user) ->
    return unless user and user.username and user.password
    deferred = $q.defer()
    Parse.User.logIn user.username, user.password,
      success: (_user) ->
        deferred.resolve _user
      error: (_user, error) ->
        deferred.reject error
    return deferred.promise

  logOut = ->
    Parse.User.logOut()

  getCurrent = ->
    currentUser = Parse.User.current()
    return currentUser

  signUp: signUp
  logIn: logIn
  logOut: logOut
  getCurrent: getCurrent
