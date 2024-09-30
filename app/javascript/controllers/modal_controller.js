import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "signInModal"];

  toggleModal() {
    this.modalTarget.classList.toggle("hidden");
    this.modalTarget.classList.toggle("flex");
  }
}
