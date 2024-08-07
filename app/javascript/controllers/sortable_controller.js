import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
//import { put, post } from "@rails/request.js"
import { put } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String }
  connect() {

    if (document.querySelector("meta[name='current_user_username']")){
      this.current_user_username=document.querySelector("meta[name='current_user_username']").getAttribute("content")
    }

    if (document.querySelector("meta[name='current_user_id']")){
      this.current_user_id=document.querySelector("meta[name='current_user_id']").getAttribute("content")
    }
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
    //Sortable.create(group_source, {
    //Sortable.create(this.element, {
    Sortable.create(group_source, {
      //filter: ".exclude",
      onMove: this.onMove.bind(this),
      onEnd: this.onEnd.bind(this),
      //sort: false,
      group: {
        name: this.groupValue,
        pull: 'clone',
        //put: false
      },
      animation: 150
    })

    Sortable.create(this.element, {
      //draggable: ".item",
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
    console.log(event.related.parentNode.getAttribute('data-sortable-item-list-id'))
    //console.log(event.dragged)
    //console.log(event.dragged.parentNode.getAttribute('data-sortable-list-id'))
    const sortableListId = event.dragged.parentNode.getAttribute('data-sortable-item-list-id')
    //console.log(sortableListId)

    //console.log(event.dragged.getAttribute('data-sortable-item-user-id'))
    const sortableItemUserId = event.dragged.getAttribute('data-sortable-item-user-id')
    //const sortableItemUserId = event.item.dataset.sortableItemUserId
    //console.log(sortableItemUserId)

    if (!this.current_user_id) {
      console.log("아예 움직이질 말어야 하는디")
      return false
    }

    if (sortableListId != 1 && this.current_user_id != sortableItemUserId) {
    // todo lists에서 clone은 모두 가능!
      return false
    }

    // 이제 group_source에 있는 items들이 움직이지 않습니다~~
    // 아 씨발 이거 어떻게 동작하는지 모르겠는데 어떤 새끼가 이렇게 대답해줬어~~
    // https://github.com/SortableJS/Sortable/issues/1627
    console.log(event.to.id)
    if (event.to.id === "group_source") {
      return event.related === event.to.children[0] && !event.willInsertAfter
    }

    //if (event.related.classList.contains('no_drag')) {
      ////console.log("움직이지 마!)
      //return false
    //}

    //if (this.current_user_id != 1 && sortableListId == 1 ) {
      //list 내에서 왔다갔다하는 거
      //걍 current_user_id가 1이 아니면 아예 움직이지 못하는 거지 머...
      //return false
    //}
  }

  onEnd(event){
    //console.log(event.item)
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
    //console.log("from list id: ", event.from)
    //console.log("to list id: ", event.to)
    //console.log("from list id: ", event.from.dataset)
    //console.log("to list id: ", event.to.dataset)
    //console.log(event.to.dataset.sortableListId)
    //const sortableListId = event.to.dataset.sortableListId
    //console.log("sortableListId", sortableListId)
    //put(sortableUpdateUrl, {
      //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
    //})

    const fromListId = event.from.dataset.sortableItemListId
    const toListId = event.to.dataset.sortableItemListId

    const sortableItemId = event.item.dataset.sortableItemId

    //if (event.clone){
      // 이렇게 하면 clone 이벤트만 처리할 줄 알았는데 event.item과 다르지 않은 거 같다
      //console.log("clone입니다.")
      //console.log(event.clone)
    //}
    if (fromListId != toListId && fromListId == 1) {
      console.log("clone")
      // 나중에 rolify 적용하게 되면 fromListId가 아니라 권한을 확인해야 함
      //post(`/items/${event.item.dataset.sortableItemId}`, {
      //post(`/items/`, {
      put(`/items/${event.item.dataset.sortableItemId}/clone`, {
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId, sortable_item_id: sortableItemId})
      }).then(response => { // 한번 reload해야 새로 추가된 item에 delete button이 활성화 된다...
        if(response.ok){
          console.log("the item successfylly created")
          window.location.reload()
        }
      })

      //window.location.reload() // 이렇게 하니까 어떨 때는 reload가 안 되는 경우도 생김...

    } else {
      console.log("move")
      put(`/items/${event.item.dataset.sortableItemId}/move`, {
        //body: JSON.stringify({row_order_position: event.newIndex, list_id: sortableListId})
        body: JSON.stringify({row_order_position: event.newIndex, list_id: toListId})
      })
    }
  }
}
