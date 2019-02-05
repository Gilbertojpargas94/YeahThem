# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# for login view
# CoffeScript time
$(document).on 'turbolinks:load', ->
  $('.next').click ->
    email= " "
    email = $('#log-email').val()
    
    if email.length == 0
      $('#alert-email').html("")
      alert = $('<div role="alert" style="margin: auto;"></div>').addClass('alert alert-danger alert-dismissible')
      message = $('<h5>Debe ingresar el nombre de la empresa</h5>').addClass('text-center').appendTo($(alert))
      alert.appendTo('#alert-email')
      return
    else
      $('#alert-email').html("")
      current_fs = $('#number_one')
      next_fs = $('#number_second')
      #show the next fieldset
      next_fs.fadeIn().show()
      #hide the current fieldset with style
      current_fs.fadeOut().hide()
      $('#email_val').append email
      # This pass the email to a hidden input field to the form for login.
      $('#email_hidden').val email
    return
  return

  