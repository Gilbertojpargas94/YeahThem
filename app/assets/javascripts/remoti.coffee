# This event is fired when the file_field for picture has change in the edit solution
$(document).on "change", ".remotipart", (ev)->
	$(this).parent().submit()