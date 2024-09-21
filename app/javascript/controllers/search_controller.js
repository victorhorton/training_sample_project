import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"]; // Define targets if necessary

  submit(event) {
    event.preventDefault();
    const searchParams = new URLSearchParams(window.location.search);
    searchParams.set("search", this.inputTarget.value);
    window.location.replace(
      location.origin + location.pathname + "?" + searchParams.toString()
    );
  }
}
