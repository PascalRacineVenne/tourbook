import consumer from "./consumer";

const initUserNotificationCable = () => {
  const notificationBell = document.getElementById('notif');
  if (notificationBell) {
    consumer.subscriptions.create({ channel: "User::NotificationChannel" }, {
      received(data) {
        // alert(data); // called when data is broadcast in the cable
        document.body.insertAdjacentHTML('beforeend', `<div class="notification-popover">${data.template}</div>`)
      },
      initialized(data) {
        console.log('hello there'); // called when data is broadcast in the cable
      },
    });
  }
}

export { initUserNotificationCable };
