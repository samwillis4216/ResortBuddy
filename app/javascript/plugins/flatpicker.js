import flatpickr from "flatpickr"
import 'flatpickr/dist/themes/airbnb.css'

flatpickr('.datepickerinput', {
  allowInput: true,
  altInput: true,
  enableTime: true,
  minDate: "today"
});
