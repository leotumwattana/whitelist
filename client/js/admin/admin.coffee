Template.admin.helpers
  whiteListedUsers: -> WhiteListedUsers.find()

Template.admin.events
  'submit form': (e, t) ->
    e.preventDefault()
    email = t.find('#white-listed-email').value
    user = { email: email }
    WhiteListedUsers.insert user
    false
