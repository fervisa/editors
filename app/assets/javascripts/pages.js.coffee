$ ->
  $('a#new-page').click ->
    preventDefault()
    newPage = JST['templates/page']()
    $('.page').last().append(newPage)
