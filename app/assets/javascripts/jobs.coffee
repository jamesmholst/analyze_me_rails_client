# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	# Isolate this script to the jobs index page
	if $('body').data('controller-name') == 'jobs'
		if $('body').data('action-name') == 'index'
			modalChart()


####################################################
#Functions
####################################################

modalChart = () ->
	# This will load a full size chart into the modal dialog when clicking
	# on a thumbnail of a chart
	$('*[data-modal-type="chart"]').click ->
		if $(this).data("modal-type") == "chart"
			if $(this).data('chart-type') == "sentiment"
				# clear out old values
				$('#modal-title').text("")
				$('#modal-body').html("")

				modal_title = "Sentiment for " + $(this).data("job-title")
				chart_data_url = "/job/sentitag_chart_json/" + $(this).data("sentitag-string")

				$('.modal').on 'shown.bs.modal', (e) ->
			  		$('#modal-title').text(modal_title)
			  		#$('#modal-body').html("") #clear any old html
			  		new Chartkick.BarChart("modal-body", chart_data_url, {"colors":["#18bc9c","#e74c3c","#74898a"]})
			  		return