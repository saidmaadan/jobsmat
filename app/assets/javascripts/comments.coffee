# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@import "foundation";

$(document).on "page:change", ->
  $("#comments-link").click(event) ->
    event.preventDefault()
    $("#comments-section").fadetoggle()
    $("#comment_body").focus()
    