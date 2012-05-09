# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#chatterform').submit (e) ->
    e.preventDefault()
    $('#chatterbox').append $('#chatter').val() + "<br />"
    send($('#chatter').val())
    $('#chatter').val('')
    return false

  poll = ->
    $.ajax({
      url: "api.tugowa.com/recv?msg=ping", 
      timeout: 30000,
      dataType: 'jsonp',
      success: (result) ->
        $('#chatterbox').append result + "<br />"
      complete: ->
        poll()
    })
  send = (msg) ->
    $.ajax({
      url: "api.tugowa.com/recv?msg=" + msg,
      timeout: 30000,
      data: {msg: msg},
      dataType: 'jsonp',
      success: (result) ->
        $('#chatterbox').append result + "<br />"
    })

  poll()
