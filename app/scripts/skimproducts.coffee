define [], ->
  url = 'http://api-product.skimlinks.com/query?q=skincare&version=3&key=b0e88fffc03968a3bd2bf7e49b962e8f&format=json'
  console.log url
  $.ajax
    url:url
    dataType:'jsonp'
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
        console.log imgArr
        $(imgArr).each ->
            wrap = '<a data-gallery=""href=# ><img src=' + @ + ' /></a>'
            $('#gallery').append(wrap)

        $('img').height('100')
        $('img').each ->
          $(@).hide() if $(@).width() > 150



# console.log req

