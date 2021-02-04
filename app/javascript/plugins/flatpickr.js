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