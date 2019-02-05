# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'form#bene-form', (event)->
    data = event.detail
    console.log data[0]
    appendBenefit = ()->
        # Append benefits to the table
        punto = '<th scope="row">&bull;</th>'
        $('#bene-desc tbody').append('<tr>'+punto+'<td><h6>'+ data[0].description + '</h6></td></tr>')
        
        # Cleaning the textarea after post a benefit
        $('#benefit-modal textarea').val("")
        $('#bene-done').show().delay(2000).fadeOut()

    # Check if is the first benefit for the solution
    if data[0].solution.branch_count < 2
        # Clear the empty row
        $('#bene-desc').find("tr:gt(0)").remove()
        appendBenefit()
    else
        appendBenefit()
        

$(document).on 'ajax:error', 'form#bene-form', (event)->
    data_error = event.detail
    $('#bene_error_explanation').empty()

    if data_error[2].status == 404
        $('#bene_error_explanation').append('<div class="alert alert-danger">No hay una solucion registrada para este benficio.</div>')
    else
        errors = JSON.parse(data_error[2].response)
        console.log errors
        errorcount = Object.keys(errors).length;

        for key of errors
            if errors.hasOwnProperty(key)
                val = errors[key]
                console.log(val)

        if errorcount > 1
            $('#bene_error_explanation').append('<div class="alert alert-danger">Se han encontrado ' + errorcount + ' errores.</div>')
        else
            $('#bene_error_explanation').append('<div class="alert alert-danger">Se encontró 1 error.</div>')
            $('#bene_error_explanation').append('<ul class="list-group">')
        
        for e of errors
            $('#bene_error_explanation').append('<li class="list-group-item">' + errors[e][0] + '</li>')
        
        $('#bene_error_explanation').append('</ul>')
        $('#bene_error_explanation').show()