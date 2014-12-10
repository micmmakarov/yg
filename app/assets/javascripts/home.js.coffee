window.YG ||= {}

YG.setLink = ->
  YG.link = "/review/#{YG.stars}/#{YG.type}"
  $("a").attr('href', YG.link)

ready = ->

  $("select").each ->
    YG[$(@).attr('id')] = $(@).val()

  YG.setLink()

  $("select").change (e) ->
    YG[$(@).attr('id')] = $(@).val()
    YG.setLink()

$(document).ready(ready)
$(document).on('page:load', ready)
