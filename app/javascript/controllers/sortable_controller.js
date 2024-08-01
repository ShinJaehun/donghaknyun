import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    console.log('이게 되나요?')
    Sortable.create(this.element, {})
  }
}
