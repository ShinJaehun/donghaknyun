import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'

// Connects to data-controller="sortable-source"
export default class extends Controller {
  static values = { group: String }
  connect() {
  }
}
