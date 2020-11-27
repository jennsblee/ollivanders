import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "booking" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }

  trigger = (event) => {
    const form = document.querySelector('#edit_booking_`$params[:id]`');
    console.log(form);
    event.preventDefault();
    fetch(form.action, {method:'post', body: new FormData(form), headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        swal({
          title: "Success",
          text: "Your booking was successfully edited",
          icon: "success",}).then((value) => {
            window.location.pathname = '/dashboard'
          });
      });
  };
}
