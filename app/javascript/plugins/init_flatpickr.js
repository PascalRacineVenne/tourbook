import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/confetti.css';

const flatPickrCal = () => {
  const fp = flatpickr("#tour_events_attributes_0_show_start_at", {
      minDate: 'today',
      enableTime: true
    });
};
export { flatPickrCal };
