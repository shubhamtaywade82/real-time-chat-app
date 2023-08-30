import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    const form = this.element;
    const textField = form.querySelector(".msg-content");
    // Reset the form
    form.reset();

    // Clear the content of the text field
    textField.value = "";
  }
}