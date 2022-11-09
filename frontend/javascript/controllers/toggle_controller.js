import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['toggleable']
  static values = { open: Boolean }

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
  }

  toggle(event) {
    this.openValue = !this.openValue
  }

  openValueChanged() {
    if (!this.toggleClass) { return }

    this.toggleableTargets.forEach(target => {
      target.classList.toggle(this.toggleClass)
    })
  }
}
