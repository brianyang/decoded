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
        #console.log e
        imgArr = []
        imgTitle = []
        $(e.skimlinksProductAPI.products).each ->
            #console.log @
            imgArr.push
              imageUrl:@imageUrl
              imageTitle:@title
              imageLink: @url
              merchant:@categorisation.merchantCategory
            #console.log imgArr
        $(imgArr).each ->
            #console.log @
            wrap = '<div class="wrap float"><a data-gallery="gallery" href=' + @imageUrl + ' ><img data-url"' + @imageLink + '" data-merchant="' + @merchant + '" title=' + @imageTitle + ' src=' + @imageUrl +
              ' /></a><br></div>'
            $('#gallery').append(wrap) if @imageUrl != ''
            $('.float').css('float','left')

        $('img').height('100').css('min-width','200')

  req.done(->
    $('#gallery').hide()
    $('#product-nav').bind 'click', ->
      $('#gallery').fadeIn(->
        $('img').each ->
          $(@).parent().parent().hide() if $(@).width() > 150
          $(@).tooltip()
      )
    $('.wrap>a>img').on 'click', ->
      console.log 'replace buy link'
  )

  $("#start-slideshow").button().click ->
    options = $(this).data()
    modal = $(options.target)
    data = modal.data("modal")
    if data
      $.extend data.options, options
    else
      options = $.extend(modal.data(), options)
    modal.find(".modal-slideshow").find("i").removeClass("icon-play").addClass "icon-pause"
    modal.modal options


# Toggle fullscreen button:
  $("#toggle-fullscreen").button().click ->
    button = $(this)
    root = document.documentElement
    unless button.hasClass("active")
      $("#modal-gallery").addClass "modal-fullscreen"
      if root.webkitRequestFullScreen
        root.webkitRequestFullScreen window.Element.ALLOW_KEYBOARD_INPUT
      else root.mozRequestFullScreen()  if root.mozRequestFullScreen
    else
      $("#modal-gallery").removeClass "modal-fullscreen"
      (document.webkitCancelFullScreen or document.mozCancelFullScreen or $.noop).apply document



# console.log req

