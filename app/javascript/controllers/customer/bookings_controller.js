import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  show() {
    this.contentTarget.innerHTML = "<%= j render 'booking_form' %>";
  }
}
