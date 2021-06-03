// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("@nathanvda/cocoon")
require("trix")
require("@rails/actiontext")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { flatPickrCal } from '../plugins/init_flatpickr';
import { initUserNotificationCable } from '../channels/user_notification_channel';
import { addTourButtonsListener, addTourButtonListener, addTourCloseButtonListener } from '../components/tour_modal';
import { editProfileButtonsListener, editProfileButtonListener, editProfileCloseButtonListener } from '../components/profile_modal';
import { editEventButtonsListener, editEventButtonListener, editEventCloseButtonListener } from '../components/event_modal';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  flatPickrCal();
  initUserNotificationCable();
  addTourButtonsListener();
  addTourButtonListener();
  addTourCloseButtonListener();
  editProfileButtonsListener();
  editProfileButtonListener();
  editProfileCloseButtonListener();
  editEventButtonsListener();
  editEventButtonListener();
  editEventCloseButtonListener();
});
