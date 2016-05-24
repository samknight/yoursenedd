$ ->
	$('.debate-header--speakers--list li:gt(9)').toggleClass('hidden')

	$('#show-speakers').click ->
		$(this).hide()
		$('.debate-header--speakers--list--speaker:gt(9)').toggleClass('hidden')
		return false
