import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { put, post } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String }
  connect() {
    //console.log(group1)
    //console.log(group2)
    //new Sortable.create(group1, {
      //group: {
        //name: this.groupValue,
        //pull: 'clone'
      //},
      //animation: 150
    //})

    //new Sortable.create(group2, {
      //onEnd: this.onEnd.bind(this),
      //group: {
        //name: this.groupValue,
      //},
      //animation: 150
    //})

    console.log(this.groupValue)
    Sortable.create(group1, {
      onEnd: this.onEnd.bind(this),
      group: {
        name: this.groupValue,
        pull: 'clone',
      },
      animation: 150
    })

    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: {
        name: this.groupValue,
      },
      animation: 150
    })

  }

  onEnd(event){
    //console.log("newIndex: ", event.newIndex)
    //console.log(event.item)
    //console.log(event.item.dataset)
    //console.log(event.item.dataset.sortableId)

    //put(`/lists/${event.item.dataset.sortableId}/sort`, {
      //body: JSON.stringify({row_order_position: event.newIndex})
    //})

    //console.log(event.item.dataset.sortableUpdateUrl)
    //const sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    //put(sortableUpdateUrl, {
      //body: JSON.stringify({row_order_position: event.newIndex})
    //})

    //console.log(event.to)
    console.log("from list id: ", event.from.dataset.sortableListId)
    console.log("to list id: ", event.to.dataset.sortableListId)
    //console.log(event.to.dataset.sortableListId)
    //const sortableListId = event.to.dataset.sortableListId
    //console.log("sortableListId", sortableListId)
    //put(sortableUpdateUrl, {
      //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
    //})

    const fromListId = event.from.dataset.sortableListId
    const toListId = event.to.dataset.sortableListId

    if (fromListId != toListId && fromListId == 1) {
      put(`/items/${event.item.dataset.sortableItemId}/clone`, {
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId})
      })

    } else {
      put(`/items/${event.item.dataset.sortableItemId}/sort`, {
        //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId})
      })
    }
  }
}
