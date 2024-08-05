import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { put, post } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String }
  connect() {

    this.current_user_username=document.querySelector("meta[name='current_user_username']").getAttribute("content")
    this.current_user_id=document.querySelector("meta[name='current_user_id']").getAttribute("content")
    //console.log(this.current_user_username)
    //this.item_user_username=document.querySelector("meta[name='item_user_username']").getAttribute("content")
    //console.log(this.item_user_username)
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

    //console.log(this.groupValue)
    Sortable.create(group1, {
      onEnd: this.onEnd.bind(this),
      group: {
        name: this.groupValue,
        pull: 'clone',
      },
      animation: 150
    })

    Sortable.create(this.element, {
      filter: ".exclude",
      onMove: this.onMove.bind(this),
      onEnd: this.onEnd.bind(this),
      group: {
        name: this.groupValue,
      },
      animation: 150
    })
  }

  onMove(event){

    //console.log(event)
    console.log(event.dragged.parentNode.getAttribute('data-sortable-list-id'))

    const sortableListId = event.dragged.parentNode.getAttribute('data-sortable-list-id')
    //console.log(event.dragged.getAttribute('data-sortable-item-user-id'))
    const sortableItemUserId = event.dragged.getAttribute('data-sortable-item-user-id')
    //const sortableItemUserId = event.item.dataset.sortableItemUserId
    if (sortableListId != 1 && this.current_user_id != sortableItemUserId) {
    // todo lists에서 clone은 모두 가능!
      return false
    }

    //} else if (sortableListId == 1 && this.current_user_id != 1) {
    // 그니까 얘는 적용이 안 되는데... list 내에서 왔다갔다하는 건 event.dragged로 처리되지 않는 듯...
      //return false
    //}
  }

  onEnd(event){
    //console.log("item_user_id: ", event.item.dataset.sortableItemUserId)
    //const sortableItemUserId = event.item.dataset.sortableItemUserId
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
    //console.log("from list id: ", event.from.dataset.sortableListId)
    //console.log("to list id: ", event.to.dataset.sortableListId)
    //console.log(event.to.dataset.sortableListId)
    //const sortableListId = event.to.dataset.sortableListId
    //console.log("sortableListId", sortableListId)
    //put(sortableUpdateUrl, {
      //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
    //})

    const fromListId = event.from.dataset.sortableListId
    const toListId = event.to.dataset.sortableListId

    const sortableItemId = event.item.dataset.sortableItemId

    if (fromListId != toListId && fromListId == 1) {
      // 나중에 rolify 적용하게 되면 fromListId가 아니라 권한을 확인해야 함
      //post(`/items/${event.item.dataset.sortableItemId}`, {
      post(`/items/`, {
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId, sortable_item_id: sortableItemId})
      }).then(response => { // 한번 reload해야 새로 추가된 item에 delete button이 활성화 된다...
        if(response.ok){
          console.log("the item successfylly created")
          window.location.reload()
        }
      })

      //window.location.reload() // 이렇게 하니까 어떨 때는 reload가 안 되는 경우도 생김...

    } else {
      put(`/items/${event.item.dataset.sortableItemId}/sort`, {
        //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId})
      })
    }
  }
}
