# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



# load script every time (maybe delete turbolink? )
$(document).on 'ready page:load', ->
  $('#chat_content').animate { scrollTop: $('#chat_content').get(0).scrollHeight }, 0
  return


$(document).on 'keypress', '.write-message', (e) ->
  if e.which == 13
    $('.send-message').click()
    return false
  return
