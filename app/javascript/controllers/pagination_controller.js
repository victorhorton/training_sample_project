import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select"]; // Define targets if necessary

  setPagination(event) {
    const searchParams = new URLSearchParams(window.location.search);
    searchParams.set("per_page", event.target.value);
    window.location.replace(
      location.origin + location.pathname + "?" + searchParams.toString()
    );
  }
}
