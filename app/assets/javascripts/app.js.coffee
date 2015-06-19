# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

download = ->
  slug = $('#download_it').data('slug')
  release_id = $('#download_it').data('release-id')
  device_type = $('.app-type').html()

  installAPI = "https://" + location.hostname + (if location.port then ':' + location.port else '') + "/api/app/" + slug + "/" + release_id + "/install/"

  if device_type == 'Android'
    url = installAPI
  else if device_type == 'iOS' || device_type == 'iPhone' || device_type == 'iPad'
    url = "itms-services://?action=download-manifest&url=" + installAPI

  console.log 'device:', device_type
  console.log 'url:', url
  window.location.href = url

# bind function
window.download = download