App['notifications'] = App.cable.subscriptions.create(
  { channel: 'NotificationsChannel' },
  { received: (data) => {
    let guestHook = document.getElementById('guest-notifications')
    let user = JSON.parse(guestHook.getAttribute('data-user'))
    data.notifiables.map((notifiable, i) => {
      if (notifiable.email === user.email) {
        // add one to number of unread notifications
        var numberOfNotifsPlusOne = (Number(document.querySelector('.notif-badge').getElementsByTagName('p')[0].innerText) + 1).toString();
        document.querySelector('.notif-badge').getElementsByTagName('p')[0].innerText = numberOfNotifsPlusOne;
        // unhide the badge (if necessary)
        document.querySelector('.notif-badge').classList.remove('hide-notif');
        // render new notification partial
        let notifContainer = document.querySelector('.notif-container');
        notifContainer.insertAdjacentHTML('beforeend', data.notification_partial);
      }
    })
  }
});
