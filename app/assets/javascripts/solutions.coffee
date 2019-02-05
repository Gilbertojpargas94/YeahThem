# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'form#solu-form', (event)->
    console.log "success de solution"
    data = event.detail
    console.log data[0] 
    id = data[0].id
    share_link = "/solutions/"
    bene_link = "/benefits/new?solution_id="
   
   # Updating the cards with the solution
    $('#sol-img').attr('src', data[0].picture)
    $('#sol-desc').text(data[0].description)
    $('#sol-branch').text(data[0].branch.name)
    # Hide the modal
    $('#solution-modal').modal("hide")
    # For show the link to the benefit modal
    $('#bene-mod-link').css("visibility", "visible")
    $('#share-link').css("visibility", "visible")
    # For past the solution id to the links
    $('#share-href').attr("href", share_link+id+"/share")
    $('#bene-href').attr("href", bene_link+""+id)

$(document).on 'ajax:error', 'form#solu-form', (event) ->
    console.log "error de solution"
    data_error = event.detail
    $('#sol_error_explanation').empty()

    if data_error[2].status == 404
        $('#sol_error_explanation').append('<div class="alert alert-danger">Selecciona una categoria.</div>')
    else
        errors = JSON.parse(data_error[2].response)
        console.log errors
        errorcount = Object.keys(errors).length;

        if errorcount > 1
            $('#sol_error_explanation').append('<div class="alert alert-danger">Se han encontrado ' + errorcount + ' errores.</div>')
        else
            $('#sol_error_explanation').append('<div class="alert alert-danger">Se encontró 1 error.</div>')
            $('#sol_error_explanation').append('<ul class="list-group">')
        
        for e of errors
            $('#sol_error_explanation').append('<li class="list-group-item">' + errors[e][0] + '</li>')
        
    $('#sol_error_explanation').append('</ul>')
    $('#sol_error_explanation').show()

$(document).on 'turbolinks:load', ->
    $('#up_picture').change ->
        $('#lbl_picture').text("Archivo cargado").addClass("text-success")

    checkboxes = $('tbody .bene_checkbox')
    checkboxes.change ->
        $('#bene-valid-btn').prop('disabled', checkboxes.filter(':checked').length < 1)
    $('tbody .bene_checkbox').change()    

    