@DevicePoller =
  poll: ->
    # Poll server after 10 seconds
    setTimeout @request, 10000

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

  
