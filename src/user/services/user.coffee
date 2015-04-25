angular.module '%module%.user'
.factory 'User', ->
  signUp = (user) ->
    return unless user and user.username and user.password and user.email
    parseUser = new Parse.User
    parseUser.set 'username', user.username
    parseUser.set 'password', user.password
    parseUser.set 'email', user.email

    parseUser.signUp null,
      success: (_user) ->
        # Hooray! Let them use the app now.
        console.log '_user', _user
        return
      error: (_user, error) ->
        console.log '_user error', _user, error
        return

  logIn = (user) ->
    return unless user and user.username and user.password

    Parse.User.logIn user.username, user.password,
      success: (_user) ->
        console.log '_user logged', _user
      error: (_user, error) ->
        console.log '_user login error', _user, error

  logOut = ->
    Parse.User.logOut()

  getCurrent = ->
    currentUser = Parse.User.current()?.attributes
    currentUser

  signUp: signUp
  logIn: logIn
  logOut: logOut
  getCurrent: getCurrent
