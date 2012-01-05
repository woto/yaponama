# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	
	# Табличка VIN

  frameModal = $("#vin-modal").modal(
    backdrop: true
    modal: true
  )

  $(".vin-link").click ->
    domModal.toggle()

  $("#vin-close").live "click", ->
    frameModal.modal('hide')	
	
	
	# Табличка FRAME
	
	
  vinModal = $("#frame-modal").modal(
    backdrop: true
    modal: true
  )

  $(".frame-link").click ->
    domModal.toggle()

  $("#frame-close").live "click", ->
    vinModal.modal('hide')

  groups = []
  $('a.gallery').each ->
    groups.push($(this).attr('rel'))

  unique = groups.filter((itm, i, a) ->
    i is a.indexOf(itm)
  )

  for rel in unique
    $('a.gallery[rel=' + rel + ']').colorbox({rel: rel})
