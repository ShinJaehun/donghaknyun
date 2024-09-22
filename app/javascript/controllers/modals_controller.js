import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  //static targets = ["modal"]
  connect() {
  }

  submitEnd(e){
    e.preventDefault()
    console.log(e.detail.success)
    if(e.detail.success){
      this.close()
    }
    //const modal=document.getElementById("modal")
    //console.log(modal)
    //modal.removeAttribute("src")
    //modal.removeAttribute("complete")
    //modal.innerHTML=""
  }

  close(){
    const modal=document.getElementById("modal")
    //console.log(modal)
    modal.removeAttribute("src")
    modal.removeAttribute("complete")
    modal.innerHTML=""
    //this.modalTarget.close()
    //this.modalTarget.removeAttribute("src")
    //this.modalTarget.removeAttribute("complete")
    //this.modalTarget.innerHTML=""
  }
}
