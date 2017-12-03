# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#application_sector_id').parent().hide()
  sectors = $('#application_sector_id').html()
  $('#application_district_id').change ->
    district = $('#application_district_id :selected').text()
    escaped_district = district.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sectors).filter("optgroup[label='#{district}']").html()


    if options
      $('#application_sector_id').html(options)
      $('#application_sector_id').parent().show()
      $('#application_sector_id').prepend('<option value="0"></option>')
      $('#application_sector_id').val(0)
    else
      $('#application_sector_id').empty()
      $('#application_sector_id').parent().hide()
