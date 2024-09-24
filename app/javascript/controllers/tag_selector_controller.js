import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["selectedTags"];

  connect() {
    this.selectedTags = this.selectedTagsTargets.map((selectedTag) => {
      return {
        id: selectedTag.dataset.id,
        name: selectedTag.dataset.name,
      };
    });
  }

  add(event) {
    debugger;
  }
}
