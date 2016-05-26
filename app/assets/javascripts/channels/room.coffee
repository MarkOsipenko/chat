App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('.messages_in_room').append data['message']
    $('textarea[placeholder="write your message"]').val ''