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
      url: "http://api.tugowa.com/recv?msg=ping", 
      timeout: 30000,
      dataType: 'jsonp',
      crossDomain: 'true',
      success: (result) ->
        $('#chatterbox').append(result.toString()) + "<br />"
      complete: ->
        poll()
    })
  send = (msg) ->
    $.ajax({
      url: "http://api.tugowa.com/recv?msg=" + msg,
      timeout: 30000,
      data: {msg: msg},
      crossDomain: 'true',
      dataType: 'jsonp',
      success: (result) ->
        $('#chatterbox').append result + "<br />"
    })

  poll()
