@isRootUser = ->
  Meteor.userId() == "movkFKJsaRQi4y7QK"

Router.map ->
  @route 'login', { path: '/' }
  @route 'admin'
  @route 'registration'
  @route 'home'

# rootAccessOnly = ->
#   user = Meteor.user()
#   if user
#     if user.emails[0].address == 'root@root.com'
#       return true

#   Router.go('/')

autoLogin = (pause) ->
  Router.go 'home' if Meteor.userId()

loginRequired = (pause) ->
  unless !!Meteor.userId()
    Router.go '/'

rootRequired = (pause) ->
  unless isRootUser()
    Router.go '/'

Router.onBeforeAction loginRequired, { only: 'home' }
Router.onBeforeAction rootRequired, { only: 'admin' }

# Router.onBeforeAction rootAccessOnly, { only: 'admin' }
Router.onBeforeAction autoLogin, { only: ['login', 'registration'] }
