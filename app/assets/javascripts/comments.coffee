# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#comments-link').click (event) ->
    event.preventDefault()
    $('#comments-section').fadeToggle()
    $("#comment_body").focus()
