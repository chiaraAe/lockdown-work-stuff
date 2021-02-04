import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


window.addEventListener("turbolinks:load", function() {
  flatpickr(".datepicker", {
    dateFormat: "Y-m-d",
    // disable: [
    //     {
    //         from: "2021-01-01",
    //         to: "2021-02-13"
    //     },
    //     {
    //         from: "2025-09-01",
    //         to: "2025-12-01"
    //     }
    // ]
  });
});


window.addEventListener("turbolinks:load", function() {
  const startDateInput = document.getElementById('booking_starting_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
  endDateInput.disabled = true


  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };
});