define [], ->
  url = 'skim.json'
  console.log url
  $.ajax
    url:url
    dataType:'json'
    success: ->
      console.log 'done'
  "Hello from skim!"
  req = $.ajax
    url:'scripts/skim.json'
    dataType:'json'
    success: (e) ->
        console.log e
        imgArr = []
        $(e.skimlinksProductAPI.products).each ->
            imgArr.push @imageUrl
        $(imgArr).each ->
            wrap = '<a data-gallery=""href=# ><img src=' + @ + ' /></a>'
            $('#gallery').append(wrap)

        $('img').height('100')

  req.done(->
    $('#gallery').hide()
    $('#product-nav').bind 'click', ->
      $('#gallery').fadeIn(->
        $('img').each ->
          $(@).hide() if $(@).width() > 150
      )
  )




# console.log req

