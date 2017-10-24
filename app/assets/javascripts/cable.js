// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  let url = ActionCable.INTERNAL.default_mount_path + "?token=1:KUi1NCeYEArdkCdchzUU";
  App.cable = ActionCable.createConsumer(url);

}).call(this);
