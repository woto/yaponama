# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  domModal = $("#modal-from-dom").modal(
    backdrop: true
    modal: true
  )
  $("#modal-from-element").click ->
    domModal.toggle()

  $("#btnPrimary").live "click", ->
    alert "btnPrimary clicked!"
    domModal.close()

  $("#btnSecondary").live "click", ->
    alert "btnSecondary clicked!"
    domModal.close()