import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { put } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String }
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue
    })
  }

  onEnd(event){
    console.log("newIndex: ", event.newIndex)
    //console.log(event.item)
    //console.log(event.item.dataset)
    //console.log(event.item.dataset.sortableId)

    //put(`/lists/${event.item.dataset.sortableId}/sort`, {
      //body: JSON.stringify({row_order_position: event.newIndex})
    //})

    //console.log(event.item.dataset.sortableUpdateUrl)
    const sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    //put(sortableUpdateUrl, {
      //body: JSON.stringify({row_order_position: event.newIndex})
    //})

    //console.log(event.to)
    //console.log(event.to.dataset)
    console.log(event.to.dataset.sortableListId)
    const sortableListId = event.to.dataset.sortableListId
    put(sortableUpdateUrl, {
      body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
    })
  }
}
