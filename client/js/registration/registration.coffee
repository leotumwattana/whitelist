isWhiteListed = (email) ->
  !!WhiteListedUsers.findOne({ email: email })

Template.registration.events
  'submit form': (e, t) ->
    e.preventDefault()

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    confirm = t.find('#accounts-confirm').value

    if isWhiteListed(email)
      user = { email: email, password: password }
      Accounts.createUser user, (error) ->
        if error
          console.log error
        else
          console.log "Succesfully created user:"
          console.log Meteor.user()
    else
      console.log "You have not been white listed!"

    false