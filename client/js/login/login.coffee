

Template.login.events
  'submit form': (e, t) ->
    e.preventDefault()

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value

    Meteor.loginWithPassword email, password, (error) ->
      if error
        console.log error
      else
        console.log 'Logged in as:'
        # console.log Meteor.user()
        # if isRootUser
          # Router.go 'admin'
        # else
          # Router.go 'main'



    false