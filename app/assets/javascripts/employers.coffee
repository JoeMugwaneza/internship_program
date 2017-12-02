# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#employer_sector_id').parent().hide()
  sectors = $('#employer_sector_id').html()
  $('#employer_district_id').change ->
    district = $('#employer_district_id :selected').text()
    escaped_district = district.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sectors).filter("optgroup[label='#{district}']").html()

    if options
      $('#employer_sector_id').html(options)
      $('#employer_sector_id').parent().show()
    else
      $('#employer_sector_id').empty()
      $('#employer_sector_id').parent().hide()
    


  
  
