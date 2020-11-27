import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "new" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }

  trigger = (event) => {
    const form = document.querySelector('#new_booking');
    console.log(form);
    event.preventDefault();
    fetch(form.action, {method:'post', body: new FormData(form), headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        swal({
          title: "Success",
          text: "Your booking was requested to wand owner",
          icon: "success",}).then((value) => {
            window.location.href = '/dashboard#v-pills-profile'
          });
      });
  };
}
