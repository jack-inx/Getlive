$(document).ready(function() {

	$("#apply_button").click(function(event) {
		event.preventDefault();
		$(this).next().removeClass('hidden');
	});

});
