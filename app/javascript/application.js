// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//import "bootstrap"
import * as bootstrap from 'bootstrap'
import "@rails/request.js"

console.log("넌 뒤졌어~")
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
console.log(popoverList)

//var myModal = document.getElementById('myModal')
//var myInput = document.getElementById('myInput')
//myModal.addEventListener('shown.bs.modal', function () {
  //myInput.focus()
//})

