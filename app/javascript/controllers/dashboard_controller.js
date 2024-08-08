import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["content"];

  showSection(event) {
    event.preventDefault();
    const section = event.currentTarget.dataset.dashboardSectionParam;

    // Hide all sections
    this.contentTargets.forEach(target => target.classList.add('hidden'));

    // Show the selected section
    const selectedSection = this.element.querySelector(`[data-section="${section}"]`);
    if (selectedSection) {
      selectedSection.classList.remove('hidden');
    }
  }
}
