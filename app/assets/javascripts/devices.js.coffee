@DevicePoller =
  poll: ->
    # Poll server after 30 seconds
    setTimeout @request, 30000

    # toggle ring's pulse class
    $(".ring").toggleClass "pulse"
    setTimeout (->
      # toggle back after 1 second
      $(".ring").toggleClass "pulse"
      return
    ), 1000
    # toggle dot's pulse class
    $(".dot").toggleClass "pulse"
    setTimeout (->
      # toggle back after 1 second
      $(".dot").toggleClass "pulse"
      return
    ), 1000

  request: ->
    $.ajax({ url: $('#devices').data('url'), dataType: "script" })

jQuery ->
  if $('#devices').length > 0
    DevicePoller.poll()

  loading_transactions = false
  $('a.load-more-transactions').on 'inview', (e, visible) ->
    return if loading_transactions or not visible
    loading_transactions = true
    $('#spinner').show()
    $('a.load-more-transactions').hide()

    $.getScript $(this).attr('href'), ->
      loading_transactions = false

  
