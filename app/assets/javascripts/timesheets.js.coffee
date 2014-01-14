# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(".assignment_job_id").live "change", ->
		if ( $(this).val() == "0" )
			$('#new_job').modal('show');