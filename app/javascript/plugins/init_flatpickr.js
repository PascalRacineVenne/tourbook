import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/airbnb.css';

const flatPickrCal = () => {
  const fp = flatpickr("#tour_events_attributes_0_show_start_at", {
      minDate: 'today',
      enableTime: true
    });
};
export { flatPickrCal };
