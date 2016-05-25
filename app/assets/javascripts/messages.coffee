# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keypress', '.write-message', (e) ->
  if e.which == 13
    $('.send-message').click()
    return false
  return