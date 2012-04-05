# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#chatterform').submit (e) ->
    e.preventDefault()
    $('#chatterbox').append $('#chatter').val() + "<br />"
    $('#chatter').val('')
    return false
