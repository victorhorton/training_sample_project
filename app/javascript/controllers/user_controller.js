import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["signUpModal", "signInModal"];

  toggleSignUpModal() {
    this.signUpModalTarget.classList.toggle("hidden");
  }

  toggleSignInModal() {
    this.signInModalTarget.classList.toggle("hidden");
  }
}
