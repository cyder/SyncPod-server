App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # Called when there's incoming data on the websocket for this channel

  add_video: (youtube_video_id) ->
    @perform 'add_video', youtube_video_id: youtube_video_id
