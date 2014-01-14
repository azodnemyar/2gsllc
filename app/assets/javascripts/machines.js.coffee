# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery.fn.submitOnCheck = ->
  @find('input[type=submit]').remove()
  @find('input[type=checkbox]').click ->
    $(this).parent('form').submit()
  this
  
jQuery ->
  $('.edit_task').submitOnCheck()

jQuery ->
  $('.date-select').datepicker({ dateFormat: 'dd-mm-yy' });
  
jQuery ->
	$('.edit-button').click ->
        $('.delete-checkbox').toggle()

jQuery ->	
	$('.delete_image').hide();
	
	$(".machine-image").hover ->
		$(this).find('.delete_image').toggle()
		
jQuery ->
	$('.note-delete').hide();
	
	$(".list-group-item").hover ->
		$(this).find('.note-delete').toggle()
		
jQuery ->
	$('.document-delete').hide();

	$(".icon-btn").hover ->
		$(this).find('.document-delete').toggle()