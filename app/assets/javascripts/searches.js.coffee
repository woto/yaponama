# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("table").tablesorter(
    widthFixed: true
    widgets: [ "zebra" ]
  ).tablesorterPager container: $("#pager")


	# Табличка Советы по поиску 

  frameModal = $("#searches-modal").modal(
    backdrop: true
    modal: true
  )

  $(".searches-link").click ->
    domModal.toggle()

  $("#searches-close").live "click", ->
    frameModal.modal('hide')	
