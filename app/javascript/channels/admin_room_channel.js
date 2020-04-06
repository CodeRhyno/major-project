import consumer from "./consumer"

consumer.subscriptions.create("AdminRoomChannel", {
  connected() {
    console.log("Connected!")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    data = data.latest_ratings
    console.log('Data', data)
    for (var i=0;i<data.length;i++) {
      if (data[i]) {
        console.log(data[i].device_id)
        const ratingTr = $('#device-rating-' + data[i].device_id)
        if (ratingTr.length) {
          console.log('<tr id="device-rating-' + data[i].device_id + '">Abc</tr>');
          ratingTr.replaceWith('<tr id="device-rating-' + data[i].device_id + '">' + '<th>' + data[i].id + '</th>' + '<th>' + data[i].device_id + '<th>' + data[i].power_consumption + '<th>' + data[i].is_online + '</th>' + '</th>' + '</th>' + '</tr>')
        } else {
          $('#device-rating-table').append('<tr id="device-rating-'+data[i].device_id+'">Abc</tr>')
        }
      }
    }
  }
});
