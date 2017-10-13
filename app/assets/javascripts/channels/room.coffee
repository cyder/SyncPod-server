App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # Called when there's incoming data on the websocket for this channel

  get_now_playing_video: ->
    @perform 'now_playing_video'

  get_play_list: ->
    @perform 'play_list'

  add_video: (youtube_video_id) ->
    @perform 'add_video', youtube_video_id: youtube_video_id

  message: (message) ->
    @perform 'message', message: message
