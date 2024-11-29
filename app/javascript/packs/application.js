// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 
//import '../stylesheets/mystyle.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require audiojs

//mediumeditorの
import MediumEditor from 'medium-editor';
import 'medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin';
import $ from 'jquery';

window.$ = $;
window.jQuery = $;

// MediumEditorの初期化例
document.addEventListener('DOMContentLoaded', () => {
  const editor = new MediumEditor('.editable');
  console.log('MediumEditor initialized:', editor);
});