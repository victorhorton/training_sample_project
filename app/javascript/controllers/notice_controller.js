import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["notice"];

  connect() {
    setTimeout(() => this.clearNotice(), 3000);
  }

  clearNotice() {
    this.noticeTarget.remove();
  }
}
