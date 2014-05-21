$ ->
  return unless $('#pages-medium').length
  editor = new MediumEditor('.editable')
  $('a#done').click (e) ->
    e.preventDefault()
    url = "#{$(this).attr 'href'}.json"
    $.ajax
      type: 'PUT'
      url: url
      data:
        content: editor.serialize()
      dataType: 'JSON'
